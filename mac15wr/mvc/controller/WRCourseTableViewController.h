//
//  WRCourseTableViewController.h
//  mac15wr
//
//  Created by Alex on 2/13/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WRCourse.h"
#import "MGSwipeTableCell.h"
#import "MGSwipeButton.h"
#import "WRCourseTableViewCell.h"

@interface WRCourseTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, MGSwipeTableCellDelegate, UIActionSheetDelegate>

@property NSMutableArray *mutableCourses;
@property (strong,nonatomic) NSMutableArray *filteredCourseArray;
@property IBOutlet UISearchBar *courseSearchBar;
@property WRCourse *courseSelected;
@property (strong, nonatomic) IBOutlet UITableView *tableview;


@end