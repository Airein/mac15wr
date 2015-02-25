//
//  WRCourseDetailViewController.m
//  mac15wr
//
//  Created by Alex on 2/24/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import "WRCourseDetailViewController.h"

@implementation WRCourseDetailViewController


-(void)viewDidLoad {
    self.courseTitleLabel.text=[self.courseSelected.sis_course_id stringByAppendingString:self.courseSelected.title];
    self.creditLabel.text=[NSString stringWithFormat:@"%.0f", self.courseSelected.min_units];
    self.descLabel.text=self.courseSelected.desc;
    for (NSDictionary *dict in self.courseSelected.section) {
        NSLog(@"%@", dict);
    }
    
}


@end
