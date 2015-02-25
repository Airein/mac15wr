//
//  WRCourse.m
//  mac15wr
//
//  Created by zwein on 2/9/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WRCourse.h"


@implementation WRCourse : NSObject

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.course_id = (double)[[attributes valueForKeyPath:@"courseID"] doubleValue];
    self.sis_course_id = (NSString*)[attributes valueForKeyPath:@"uCourseID"];
    self.title = (NSString*)[attributes valueForKeyPath:@"title"];
    self.min_units = (double)[[attributes valueForKeyPath:@"minUnits"] doubleValue];
    self.max_units = (double)[[attributes valueForKeyPath:@"maxUnits"] doubleValue];
    self.total_max_units = [[attributes valueForKeyPath:@"tMaxUnits"] isKindOfClass:[NSNull class]]?0:(double)[[attributes valueForKeyPath:@"tMaxUnits"] doubleValue];
    self.desc = (NSString*)[attributes valueForKeyPath:@"description"];
    self.diversity_flag = (NSString*)[attributes valueForKey:@"dFlag"];
    self.effective_term_code = (NSString*)[attributes valueForKey:@"eTermCode"];
    //
    self.section = [attributes valueForKey:@"section"];
   // self.user = [[User alloc] initWithAttributes:[attributes valueForKeyPath:@"user"]];
    
    return self;
}


- (void) test{
    NSLog(@"test");
}

@end
