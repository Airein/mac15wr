//
//  WRDataFormatChange.h
//  mac15wr
//
//  Created by Alex on 2/27/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WRDataFormatChange : NSObject


+ (NSData*) NSDictionary2NSData:(NSDictionary *)dic;
+ (NSDictionary*) NSData2NSDictionary:(NSData *)data;

@end
