//
//  WRRealmCourse.h
//  mac15wr
//
//  Created by Alex on 2/27/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import <Realm/Realm.h>

@interface WRRealmCourse : RLMObject
@property double course_id;
@property NSString* sis_course_id;
@property NSString* title;
@property double min_units;
@property double max_units;
@property double total_max_units;
@property NSString* desc;
@property NSString* diversity_flag;
@property NSString* effective_term_code;
@property NSData* section;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<WRRealmCourse>
RLM_ARRAY_TYPE(WRRealmCourse)
