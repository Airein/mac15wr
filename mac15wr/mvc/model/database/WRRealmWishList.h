//
//  WRRealmWishList.h
//  mac15wr
//
//  Created by Alex on 2/27/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import <Realm/Realm.h>

@interface WRRealmWishList : RLMObject
@property NSString* sis_course_id;
@property NSString* title;
@property NSData* section;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<WRRealmWishList>
RLM_ARRAY_TYPE(WRRealmWishList)