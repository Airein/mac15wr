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
    
    self.course_id = (double)[[attributes valueForKeyPath:@"COURSE_ID"] doubleValue];
    self.sis_course_id = (NSString*)[attributes valueForKeyPath:@"SIS_COURSE_ID"];
    self.title = (NSString*)[attributes valueForKeyPath:@"TITLE"];
    self.min_units = (double)[[attributes valueForKeyPath:@"MIN_UNITS"] doubleValue];
    self.max_units = (double)[[attributes valueForKeyPath:@"MAX_UNITS"] doubleValue];
    self.total_max_units = [[attributes valueForKeyPath:@"TOTAL_MAX_UNITS"] isKindOfClass:[NSNull class]]?0:(double)[[attributes valueForKeyPath:@"TOTAL_MAX_UNITS"] doubleValue];
    self.desc = (NSString*)[attributes valueForKeyPath:@"DESCRIPTION"];
    self.diversity_flag = (NSString*)[attributes valueForKey:@"DIVERSITY_FLAG"];
    self.effective_term_code = (NSString*)[attributes valueForKey:@"EFFECTIVE_TERM_CODE"];
    //
    self.section = [attributes valueForKey:@"SECTIONS"];
   // self.user = [[User alloc] initWithAttributes:[attributes valueForKeyPath:@"user"]];
    
    return self;
}


- (void) test{
    NSLog(@"test");
}

@end
