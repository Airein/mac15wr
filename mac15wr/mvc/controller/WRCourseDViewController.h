//
//  WRCourseDViewController.h
//  mac15wr
//
//  Created by Alex on 2/25/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WRCourse.h"


@interface WRCourseDViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *courseTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *courseIDLabel;

@property WRRealmCourse *courseSelected;
@property NSMutableArray *sections;
@property (weak, nonatomic) IBOutlet UITableView *tableview;



@end
