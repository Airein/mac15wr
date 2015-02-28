//
//  WRDeptListTableViewController.h
//  mac15wr
//
//  Created by Alex on 2/28/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WRDeptListTableViewController : UITableViewController
@property NSString* schoolAbb;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@end
