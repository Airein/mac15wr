//
//  WRWeekCalendarView.m
//  mac15wr
//
//  Created by zwein on 2/23/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import "WRWeekCalendarView.h"

@interface WRWeekCalendarView ()


@end


@implementation WRWeekCalendarView



-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor cloudsColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 15.0;
    

    
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




@end
