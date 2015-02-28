//
//  RightViewController.m
//  mac15wr
//
//  Created by zwein on 2/14/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import "RightViewController.h"

#define BG_OFFSET SCREEN_WIDTH-80

@interface RightViewController (){
    CGPoint bgCenter;
    UILabel *titleLabel;
}

@end

@implementation RightViewController
@synthesize rbgView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _wishlistContent = [[NSMutableArray alloc] init];
//    [_wishlistContent addObjectsFromArray:[[NSArray alloc] initWithObjects:
//                                            @"class one",
//                                            @"class two",
//                                            nil]];
//
    [self loadListView];
    [self showCheckListView];
    
    [self.centerViewControllerDelegate.wishlistBox addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wishlistBoxClicked)]];
    [self.centerViewControllerDelegate.checklistBox addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(checklistBoxClicked)]];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wishListBoxChanged:) name:@"WishListBoxChangedNotificatoin" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkListBoxChanged:) name:@"CheckListBoxChangedNotificatoin" object:nil];
}



-(void) loadListView{
    rbgView = [[UIView alloc] init];
    rbgView.frame = CGRectMake(100, 20, SCREEN_WIDTH-80, SCREEN_HEIGHT-40);
    bgCenter =  rbgView.center;
    rbgView.center = CGPointMake(bgCenter.x + BG_OFFSET, bgCenter.y);
    rbgView.backgroundColor = [UIColor WR_USC_Yellow];
    rbgView.layer.cornerRadius = 36.0;
    [self.view addSubview:rbgView];

    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH-80, 40);
    headerView.backgroundColor = [UIColor WR_USC_Red];
    //    headerView.layer.cornerRadius = 24.0;
    UIRectCorner corner = UIRectCornerTopLeft;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:headerView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(40, 40)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = headerView.bounds;
    maskLayer.path = maskPath.CGPath;
    headerView.layer.mask = maskLayer;
    [rbgView addSubview:headerView];
    
    titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, 0, CGRectGetWidth(headerView.bounds), CGRectGetHeight(headerView.bounds));
//    titleLabel.text = @"Wish List";
    titleLabel.textColor = [UIColor WR_USC_Yellow];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:35.0];
    [headerView addSubview:titleLabel];
    
    
    // wish list
    _wishlistTable = [[WishListTableView alloc] initWithFrame:CGRectMake(10, 50, CGRectGetWidth(rbgView.bounds)-30, CGRectGetHeight(rbgView.bounds)-65)];
    [_wishlistTable reloadData];
    _wishlistTable.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [rbgView addSubview:_wishlistTable];
    // checkout list
    _checkoutTable = [[CheckListTableView alloc] initWithFrame:CGRectMake(10, 50, CGRectGetWidth(rbgView.bounds)-30, CGRectGetHeight(rbgView.bounds)-65)];
    [_checkoutTable reloadData];
    _checkoutTable.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [rbgView addSubview:_checkoutTable];
//    _checkoutTable.alpha = 0;
    
    
//    self.checkoutButton = [[UIButton alloc] init];
//    self.checkoutButton.frame = CGRectMake(0, 0, 200, 50);
//    self.checkoutButton.center = CGPointMake(CGRectGetWidth(rbgView.frame)/2, CGRectGetMaxY(rbgView.frame)-54);
//    [self.checkoutButton setBackgroundColor:[UIColor WR_USC_Red]];
//    self.checkoutButton.titleLabel.text = @"Check Out";
//    self.checkoutButton.titleLabel.textAlignment = NSTextAlignmentCenter;
//    self.checkoutButton.titleLabel.font = [UIFont boldSystemFontOfSize:36.f];
//    self.checkoutButton.titleLabel.textColor = [UIColor WR_USC_Yellow];
////    [self.checkoutButton setTitleColor:[UIColor WR_USC_Yellow] forState:UIControlStateNormal];
//    [self.rbgView addSubview:self.checkoutButton];
//    
    
}

-(void)showWishListView{
    CGFloat offset = 130.f;
    CGFloat duration = 0.4f;
    [UIView animateWithDuration:duration animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            self.checkoutTable.alpha = 0;
        self.rbgView.center = CGPointMake(self.rbgView.center.x+offset, self.rbgView.center.y);
            self.wishlistTable.alpha = 0;
        [self.wishlistTable loadData];
        [self.wishlistTable reloadData];
    } completion:^(BOOL finished) {
        titleLabel.text = @"Wish List";

        [UIView animateWithDuration:duration animations:^{
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            self.rbgView.center = CGPointMake(self.rbgView.center.x-offset, self.rbgView.center.y);
            self.wishlistTable.alpha = 1;
        } completion:^(BOOL finished) {
            //执行完后走这里的代码块
        }];
    }];
    
    

}

-(void)showCheckListView{
    CGFloat offset = 130.f;
    CGFloat duration = 0.4f;

    [UIView animateWithDuration:duration animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        self.checkoutTable.alpha = 0;
        self.rbgView.center = CGPointMake(self.rbgView.center.x+offset, self.rbgView.center.y);
        self.wishlistTable.alpha = 0;
        
        [self.checkoutTable loadData];
        [self.checkoutTable reloadData];
    } completion:^(BOOL finished) {
        titleLabel.text = @"Checkout List";

        //执行完后走这里的代码块
        [UIView animateWithDuration:duration animations:^{
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            self.rbgView.center = CGPointMake(self.rbgView.center.x-offset, self.rbgView.center.y);
            self.checkoutTable.alpha = 1;
        } completion:^(BOOL finished) {
            //执行完后走这里的代码块
        }];
    }];
    
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

-(void) openWishListView{
    if ([self.viewDeckController isSideClosed:IIViewDeckRightSide]) {
        [self.viewDeckController openRightView];
    }
    [self showWishListView];
}
-(void) openCheckListView{
    if ([self.viewDeckController isSideClosed:IIViewDeckRightSide]) {
        [self.viewDeckController openRightView];
    }
    [self showCheckListView];
}

-(void)wishlistBoxClicked{
    [self openWishListView];
}

-(void)checklistBoxClicked{
    [self openCheckListView];
}



-(void) presentViewContent{
    [UIView animateWithDuration:FIVEPAGE_TRANSITION_DURATION animations:^{
        //[UIView setAnimationDelay:1.2];//配置动画时延
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        rbgView.center = bgCenter;//CGPointMake(bgCenter.x + 100, bgCenter.y);
        [rbgView setAlpha:1.0];
       
    } completion:^(BOOL finished) {
        //执行完后走这里的代码块
    }];
    
}


-(void) hideViewContent{
    [UIView animateWithDuration:FIVEPAGE_TRANSITION_DURATION animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        rbgView.center = CGPointMake(bgCenter.x + BG_OFFSET, bgCenter.y);
        [rbgView setAlpha:0.2];
        
    } completion:^(BOOL finished) {
        //执行完后走这里的代码块
    }];
}


-(void)wishListBoxChanged:(NSNotification*)notification{
    NSString *str =  notification.object;
    if ([str isEqualToString:@"+"]) {
        NSString *intString =  self.centerViewControllerDelegate.wishlistBadge.text;
        self.centerViewControllerDelegate.wishlistBadge.text
            = [NSString stringWithFormat:@"%d",[intString intValue] + 1];

    } else if ([str isEqualToString:@"-"]) {
        NSString *intString =  self.centerViewControllerDelegate.wishlistBadge.text;
        self.centerViewControllerDelegate.wishlistBadge.text
        = [NSString stringWithFormat:@"%d",[intString intValue] - 1];
    }
    
    
}
-(void)checkListBoxChanged:(NSNotification*)notification{
    NSString *str =  notification.object;
    if ([str isEqualToString:@"+"]) {
        NSString *intString =  self.centerViewControllerDelegate.checklistBadge.text;
        self.centerViewControllerDelegate.checklistBadge.text
        = [NSString stringWithFormat:@"%d",[intString intValue] + 1];
        
    } else if ([str isEqualToString:@"-"]) {
        NSString *intString =  self.centerViewControllerDelegate.checklistBadge.text;
        self.centerViewControllerDelegate.checklistBadge.text
        = [NSString stringWithFormat:@"%d",[intString intValue] - 1];
    }
    
}



@end
