//
//  WRRealmDeptList.h
//  mac15wr
//
//  Created by Alex on 2/28/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import <Realm/Realm.h>

@interface WRRealmDeptList : RLMObject
@property NSString* SchoolAbb;
@property NSString* DeptAbb;
@property NSString* DeptName;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<WRRealmDeptList>
RLM_ARRAY_TYPE(WRRealmDeptList)
