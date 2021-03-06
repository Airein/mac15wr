//
//  WishListTableView.m
//  mac15wr
//
//  Created by zwein on 2/24/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import "WishListTableView.h"
#import "WishListCell.h"
#import <Realm/Realm.h>
#import "WRRealmWishList.h"

@implementation WishListTableView

- (void) loadData{
    
    //所有的总数据数组 数组套数组 最里面是model 下边创建的仅仅是测试数组
    _array = [[NSMutableArray alloc]initWithCapacity:0];
    
    // get wishlist
    RLMResults *wishlistItems = [WRRealmWishList allObjects]; // retrieves all Dogs from the default Realm
    
    NSMutableDictionary *wishlistDictionary =
    [[NSMutableDictionary alloc] initWithCapacity:0];
    for (WRRealmWishList *wishListItem in wishlistItems) {
        NSString *idString = wishListItem.sis_course_id;
        //        NSLog(@"%@",idString);
        if ([[wishlistDictionary allKeys] containsObject:idString]) {  // has this key
            
            NSMutableDictionary *courseDict = [wishlistDictionary valueForKey:idString];
            
            NSMutableArray *list = [courseDict valueForKey:@"course_sections"];
            NSMutableDictionary *sectionDict = [[NSMutableDictionary alloc] initWithCapacity:0];
            [sectionDict setValue:@"no" forKeyPath:@"isExpand"];
            [sectionDict setValue:wishListItem forKeyPath:@"section"];
            [list addObject:sectionDict];
            
        } else {  // add this key and object(array for many sections)
            NSMutableArray *list = [[NSMutableArray alloc] initWithCapacity:0];
            NSMutableDictionary *sectionDict = [[NSMutableDictionary alloc] initWithCapacity:0];
            [sectionDict setValue:@"no" forKeyPath:@"isExpand"];
            [sectionDict setValue:wishListItem forKeyPath:@"section"];
            [list addObject:sectionDict];
            
            NSMutableDictionary * courseDict =
            [[NSMutableDictionary alloc] initWithCapacity:0];
            [courseDict setValue:idString forKeyPath:@"course_id"];
            [courseDict setValue:wishListItem.title forKeyPath:@"course_title"];
            [courseDict setValue:list forKeyPath:@"course_sections"];
            [courseDict setValue:@[] forKeyPath:@"isExpand"];
            
            [wishlistDictionary setObject:courseDict forKey:idString];
        }
    }
    
    for (NSMutableDictionary *courseDict in [wishlistDictionary allValues]) {
        [_array addObject:courseDict];
    }
    
    
    //    for (int i = 0; i < 3; i++) {
    //        NSMutableArray *section=[[NSMutableArray alloc]initWithCapacity:0];
    //
    //        for (int j = 0; j < 3; j++)
    //        {
    //            wishListModel *model=[[wishListModel alloc]init];
    //            model.str1 =[NSString stringWithFormat:@"张三%d",i];
    //            model.str2 = [NSString stringWithFormat:@"aaaa%d",j];
    //            model.isExpand = NO;
    //            [section addObject:model];
    //        }
    //
    //        [_array addObject:section];
    //    }
    
    //表数据源数组
    _CurrentArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (int i = 0; i<_array.count; i++) {
        [_CurrentArray addObject:@[]];
    }
    
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    //    self =[super initWithFrame:CGRectMake(10, 30, 300, 500) style:UITableViewStyleGrouped];
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    self.separatorColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    //创建表
    self.delegate = self;
    self.dataSource = self;
    [self loadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WishListBoxChanged:) name:@"WishListBoxChangedNotificatoin" object:nil];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wishListAddToChecklistCalendar:) name:@"WishListAddToCheckListNotification" object:nil];

    
    return self;
}


#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _CurrentArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *cellIdentifier = @"WRRightViewwishListCell";
    
    NSMutableDictionary *courseDict = [_CurrentArray objectAtIndex:indexPath.section];
    NSMutableArray *sections = [courseDict valueForKey:@"course_sections"];
    NSMutableDictionary *sectionDict = sections[indexPath.row];
    WRRealmWishList *cl =  [sectionDict valueForKey:@"section"];
    
    NSDictionary *section = [WRDataFormatChange NSData2NSDictionary:cl.section];
    WishListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[WishListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    else
    {
        
        //        if (cell.model) {
        //            if (cell.model != [[sections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]) {
        //                cell.model = [[sections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        //                if (cell.model.isExpand==NO) {
        //                    cell.model=nil;
        //                }
        //            }
        //        }else
        //        {
        //            cell.model = [[sections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        //            if (cell.model.isExpand==NO) {
        //                cell.model=nil;
        //            }
        //        }
        
    }
    cell.TitleLabel.text = @"";
    cell.courseTypeLabel.text = [section valueForKey:@"type"];
    cell.courseLocationLabel.text = [section valueForKey:@"location"];
    cell.courseDateLabel.text = [[NSString alloc] initWithFormat:@"%@-%@ %@", [section valueForKey:@"bTime"], [section valueForKey:@"eTime"], [section valueForKey:@"day"]];
    cell.detialView.sectionIdLabel.text = [[NSString alloc]
                                           initWithFormat:@"Section ID: %@", [section valueForKey:@"sectionID"]];
    
    cell.detialView.sectionProfessorLabel.text = [[NSString alloc]
                                                  initWithFormat:@"Instructor: %@", [section valueForKey:@"instructor"]];
    
    cell.detialView.sectionSeatsLabel.text = [[NSString alloc]
                                              initWithFormat:@"Seats Registered: %@/%@", [section valueForKey:@"registered"], [section valueForKey:@"seats"]];
    cell.detialView.realmWishlist = cl;
    
    
    [cell layoutSubviews];
    
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    return [[_CurrentArray objectAtIndex:section] count];
    NSMutableDictionary *courseDict = [_CurrentArray objectAtIndex:section];
    return [[courseDict valueForKey:@"course_sections"] count];
    
}
//点击单元格 展开、收缩 model信息
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WishListCell *cell=(WishListCell*)[tableView cellForRowAtIndexPath:indexPath];
    NSMutableDictionary *courseDict = [_array objectAtIndex:indexPath.section];
    NSMutableArray *arr  = [courseDict valueForKey:@"course_sections"];
    NSMutableDictionary *sectionDict = arr[indexPath.row];
    
    if (cell.isExpand) {
        [sectionDict setValue:@"no" forKey:@"isExpand"];
    } else{
        [sectionDict setValue:@"yes" forKey:@"isExpand"];
    }
    cell.isExpand = !cell.isExpand;
    
    
    
    
    
    //    wishListModel *model=[[_array objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    //    model.isExpand = !model.isExpand;
    //
    //    if (cell.model) {
    //        cell.model=nil;
    //    }else
    //    {
    //        cell.model=model;
    //    }
    
    
    [cell layoutSubviews];
    [tableView reloadData];
}
//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
//判断model是否被展示 来控制单元格高度
//可以在自定义view中 写+号方法计算 以下因没具体数据是省略写法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    wishListCell *cell=(wishListCell*)[tableView cellForRowAtIndexPath:indexPath];
    //
    //    if (cell.isExpand) {
    //        return 124;
    //    } else {
    //        return 44;
    //    }
    
    NSMutableDictionary *courseDict = [_array objectAtIndex:indexPath.section];
    NSMutableArray *arr  = [courseDict valueForKey:@"course_sections"];
    NSMutableDictionary *sectionDict = arr[indexPath.row];
    NSString *isExpand = [sectionDict valueForKey:@"isExpand"];
    if ([isExpand isEqualToString:@"no"]) {
        return  44;
    } else {
        return 224;
    }
    
    //    wishListModel *model=[[_array objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    //    if (!model.isExpand)
    //    {
    //        return   44;
    //    }else
    //    {
    //        return  124;
    //    }
    
}
//自定义区头 把区头model 创建的view写这里
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSMutableCharacterSet *courseDict = _array[section];
    NSString *courseId =  [courseDict valueForKey:@"course_id"];
    NSString *courseName = [courseDict valueForKey:@"course_title"];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 44)];
    view.backgroundColor = [UIColor WR_USC_Yellow];
    view.layer.borderWidth = 1.;
    view.layer.borderColor = [UIColor WR_USC_Red].CGColor;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 84,44);
    btn.backgroundColor=[UIColor WR_USC_Red];
    btn.titleLabel.textColor = [UIColor WR_USC_Yellow];
    [btn setTitle:courseId forState:UIControlStateNormal];
    btn.tag = section;
    [btn addTarget:self action:@selector(expand:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    UILabel *headerLabel = [[UILabel alloc] init];
    headerLabel.frame = CGRectMake(CGRectGetMaxX(btn.bounds) + 20, 0, CGRectGetWidth(view.bounds)-CGRectGetMaxX(btn.bounds), CGRectGetHeight(view.bounds));
    headerLabel.text = courseName;  // 通过setion 的 区别和获取课程表
    headerLabel.textColor = [UIColor WR_USC_Red];
    headerLabel.textAlignment = NSTextAlignmentLeft;
    headerLabel.font = [UIFont boldSystemFontOfSize:20.0];
    [view addSubview:headerLabel];
    
    
    UIView *seperator = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(view.bounds),
                                                                CGRectGetWidth(view.bounds), 0)];
    seperator.backgroundColor = [UIColor WR_USC_Yellow];
    
    UIView *container = [[UIView alloc]initWithFrame:CGRectMake(0, 0,
                                                                CGRectGetWidth(view.bounds),
                                                                CGRectGetHeight(view.bounds)+
                                                                CGRectGetHeight(seperator.bounds))];
    container.backgroundColor = [UIColor clearColor];
    [container addSubview:view];
    [container addSubview:seperator];
    
    return container;
    
}

#pragma mark - ActionMethord
//点击区头按钮 修改数据源数组 展开区
- (void)expand:(UIButton*)btn
{
    NSMutableDictionary *courseDict = [_CurrentArray objectAtIndex:btn.tag];
    //    NSMutableArray *list = [courseDict valueForKey:@"course_sections"];
    
    
    
    if([[courseDict valueForKey:@"isExpand"] isEqualToArray:@[]])
    {
        [_CurrentArray replaceObjectAtIndex:btn.tag
                                 withObject:[_array objectAtIndex:btn.tag]];
        [courseDict setValue:@[@"expand"] forKeyPath:@"isExpand"];
        //
        //        [courseDict setValueforKey:[[NSMutableArray alloc] initWithObjects:@"expand", nil] forKey:@"isExpand"];
    }else
    {
        NSMutableDictionary *tmp = [[NSMutableDictionary alloc] initWithCapacity:0];
        [tmp setValue:@[] forKeyPath:@"isExpand"];
        [_CurrentArray replaceObjectAtIndex:btn.tag withObject:tmp];
    }
    
    [self reloadData];
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)WishListBoxChanged:(NSNotification*)notification
{
    
    [UIView animateWithDuration:0.8 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        self.alpha = 0.2;
        [self loadData];
        [self reloadData];

    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 animations:^{
            [self loadData];
            [self reloadData];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            self.alpha = 1;
        } completion:^(BOOL finished) {
            //执行完后走这里的代码块
        }];
    }];
    
}

@end
