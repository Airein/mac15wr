//
//  WRSchoolList.m
//  mac15wr
//
//  Created by Alex on 2/26/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import "WRSchoolList.h"

@implementation WRSchoolList


- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.schoolList = [attributes allKeys];
    return self;
}

@end
