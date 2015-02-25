//
//  CenterViewController.h
//  mac15wr
//
//  Created by zwein on 2/14/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WRFiveViewController.h"
#import "CircleProgressView.h"
#import "OverallCircleProgressView.h"
#import "CKRadialMenu.h"
#import "KVNMaskedPageControl.h"


enum {
    IIViewDeckCenterCP,
    IIViewDeckLeftCP,
    IIViewDeckRightCP,
    IIViewDeckTopCP,
    IIViewDeckBottomCP,
};
typedef UInt32 IIViewDeckCP;


@interface CenterViewController : WRFiveViewController<CKRadialMenuDelegate>

@property (strong, nonatomic) CircleProgressView *circleProgressView;
@property (strong, nonatomic) OverallCircleProgressView *overallCircleProcessView;

@property (assign, nonatomic) IIViewDeckCP deckCP;   // deck view current position

@property (strong, nonatomic) KVNMaskedPageControl *pageControl;

@end
