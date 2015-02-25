//
//  RightViewController.h
//  mac15wr
//
//  Created by zwein on 2/14/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WRFiveViewController.h"
#import "CenterViewController.h"
#import "WishListTableView.h"

@interface RightViewController : WRFiveViewController

@property (strong, nonatomic) CenterViewController *centerViewControllerDelegate;

@property (nonatomic, strong) WishListTableView *wishlistTable;
@property (nonatomic, strong) NSMutableArray *wishlistContent;

@property (nonatomic, strong) UITableView *checkoutTable;
@property (nonatomic, strong) NSMutableArray *checkoutContent;



@end
