//
//  WRRealmCourse.h
//  mac15wr
//
//  Created by Alex on 2/27/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import <Realm/Realm.h>

@interface WRRealmCourse : RLMObject
@property NSString* abc;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<WRRealmCourse>
RLM_ARRAY_TYPE(WRRealmCourse)
