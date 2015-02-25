//
//  WRCourseDetailViewController.h
//  mac15wr
//
//  Created by Alex on 2/24/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WRCourse.h"

@interface WRCourseDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *courseTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *creditLabel;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *sectionButton;
@property (weak, nonatomic) IBOutlet UILabel *sectionsLabel;
@property WRCourse *courseSelected;
@end
