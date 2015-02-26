//
//  ViewController.m
//  mac15wr
//
//  Created by zwein on 15/2/7.
//  Copyright (c) 2015年 mac15wr. All rights reserved.
//

#import "ViewController.h"
#import <GoogleOpenSource/GoogleOpenSource.h>
#import <GooglePlus/GooglePlus.h>


@interface ViewController ()
@property NSMutableArray *mutableCourses;
@property (weak, nonatomic) IBOutlet UIButton *courseButton;

@end

@implementation ViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.naviItem.title = self.email;
    
    
    
    
    
    [[WRAPIClient sharedClient] GET:@"course/search/20151/CSCI" parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        self.mutableCourses = [NSMutableArray arrayWithCapacity:[JSON count]];
        for (NSDictionary *course_attributes in JSON) {
            
            WRCourse *course = [[WRCourse alloc] initWithAttributes:course_attributes];
            [self.mutableCourses addObject:course];
        }
        
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        
    }];
    
    
}








#pragma mark - pass course data between views
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowCourseList"] || [[segue identifier] isEqualToString:@"submitInfo"]) {
        UINavigationController *nav = [segue destinationViewController];
        WRCourseTableViewController* userViewController = (WRCourseTableViewController *) nav.topViewController;
        userViewController.mutableCourses = self.mutableCourses;
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
