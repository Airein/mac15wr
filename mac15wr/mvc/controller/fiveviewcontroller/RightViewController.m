//
//  RightViewController.m
//  mac15wr
//
//  Created by zwein on 2/14/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _wishlistContent = [[NSMutableArray alloc] init];
//    [_wishlistContent addObjectsFromArray:[[NSArray alloc] initWithObjects:
//                                            @"class one",
//                                            @"class two",
//                                            nil]];
//
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.frame = CGRectMake(100, 20, SCREEN_WIDTH-80, SCREEN_HEIGHT-40);
    backgroundView.backgroundColor = [UIColor WR_USC_Yellow];
    backgroundView.layer.cornerRadius = 24.0;
    
    
    
    
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH-80, 40);
    headerView.backgroundColor = [UIColor WR_USC_Red];
//    headerView.layer.cornerRadius = 24.0;
    UIRectCorner corner = UIRectCornerTopLeft;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:headerView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(20, 20)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = headerView.bounds;
    maskLayer.path = maskPath.CGPath;
    headerView.layer.mask = maskLayer;
    [backgroundView addSubview:headerView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, 0, CGRectGetWidth(headerView.bounds), CGRectGetHeight(headerView.bounds));
    titleLabel.text = @"Check List";
    titleLabel.textColor = [UIColor WR_USC_Yellow];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:35.0];
    [headerView addSubview:titleLabel];

    _wishlistTable = [[WishListTableView alloc] initWithFrame:CGRectMake(10, 50, CGRectGetWidth(backgroundView.bounds)-30, CGRectGetHeight(backgroundView.bounds)-60)];
    [_wishlistTable reloadData];
    
//    _wishlistTable.frame = self.view.bounds;
    _wishlistTable.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [backgroundView addSubview:_wishlistTable];
//    [_wishlistTable._bigTableView ]
//    _wishlistTable.separatorColor = [UIColor clearColor];
//    _wishlistTable.alpha = 0.9;
//    _wishlistTable.backgroundColor = [UIColor alizarinColor];
//    _wishlistTable.delegate = self;
//    _wishlistTable.dataSource = self;
//    //_wishlistTable.dataSource = _checklistContent;
    [self.view addSubview:backgroundView];
    
    
    
    
}

//
//#pragma mark - Table View Data source
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
//(NSInteger)section{
//    return [self.wishlistContent count];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
//(NSIndexPath *)indexPath{
//    static NSString *cellIdentifier = @"WRChecklistContent";
//    
//    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
//    //                             cellIdentifier];
//    //    if (cell == nil) {
//    //        cell = [[UITableViewCell alloc]initWithStyle:
//    //                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    //        cell.textLabel.textColor = [UIColor cloudsColor];
//    //        cell.backgroundColor = [UIColor alizarinColor];
//    //        cell.textLabel.font = [UIFont boldSystemFontOfSize:20.0];
//    //
//    //    }
//    TDBadgedCell *cell =[[TDBadgedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    cell.textLabel.textColor = [UIColor cloudsColor];
//    cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
//    cell.backgroundColor = [UIColor alizarinColor];
//    cell.badgeString = @"checked";
//    cell.badgeColor = [UIColor sunflowerColor];
//    cell.badgeTextColor = [UIColor pomegranateColor];
//    //cell.badge.radius = 9;
//    cell.badge.fontSize = 13;
//    cell.badge.boldFont = YES;
//    cell.badge.layer.borderWidth = 0;
//    cell.badge.layer.borderColor = [UIColor whiteColor].CGColor;
//    
//    
//    
//    
//    NSString *stringForCell = [self.wishlistContent objectAtIndex:indexPath.row];
//    //NSLog(@"%@", stringForCell);
//    [cell.textLabel setText:stringForCell];
//    return cell;
//}
//
//// Default is 1 if not implemented
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
//
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//
//#pragma mark - TableView delegate
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
//(NSIndexPath *)indexPath{
//    
//    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.textLabel.highlightedTextColor = [UIColor pomegranateColor];
//    
//    
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
