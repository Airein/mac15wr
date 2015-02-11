//
//  ViewController.m
//  mac15wr
//
//  Created by zwein on 15/2/7.
//  Copyright (c) 2015年 mac15wr. All rights reserved.
//

#import "ViewController.h"
#import "WRCourse.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    [[WRAPIClient sharedClient] GET:@"Courses/20151/FADW" parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
       
        NSMutableArray *mutableCourses = [NSMutableArray arrayWithCapacity:[JSON count]];
        for (NSDictionary *course_attributes in JSON) {
            
            WRCourse *course = [[WRCourse alloc] initWithAttributes:course_attributes];
            [mutableCourses addObject:course];
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
       
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
