//
//  WRFiveViewManager.m
//  mac15wr
//
//  Created by zwein on 2/14/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import "WRFiveViewManager.h"




@implementation WRFiveViewManager

+ (WRFiveViewManager *)sharedInstance
{
    static WRFiveViewManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WRFiveViewManager alloc] init];
        [sharedInstance initFiveControllers];
    });
    return sharedInstance;
}


- (void)initFiveControllers{
  
        // init five controllers
        self.centerViewController = [[CenterViewController alloc] init];
        self.leftViewController = [[LeftViewController alloc] init];
        self.rightViewController = [[RightViewController alloc] init];
        self.topViewController = [[TopViewController alloc] init];
        self.bottomViewController = [[BottomViewController alloc] init];
        
        // load into array for furture use
        self.fiveVewControllers = [[NSArray alloc] initWithObjects:
                                   self.centerViewController,
                                   self.leftViewController,
                                   self.rightViewController,
                                   self.topViewController,
                                   self.bottomViewController,
                                   nil];
}

- (IIViewDeckController*) getDeckController{
    if (self.deckViewController==NULL) {
        CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
        CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
        CGFloat ccoffset = 40.00;
        
        self.deckViewController =  [[IIViewDeckController alloc]
                                    initWithCenterViewController:self.centerViewController
                                    leftViewController:self.leftViewController
                                    rightViewController:self.rightViewController
                                    topViewController:self.topViewController
                                    bottomViewController:self.bottomViewController];
        self.deckViewController.panningMode = IIViewDeckPanningViewPanning;
        self.deckViewController.leftSize = screenWidth/2-ccoffset;
        self.deckViewController.rightSize = screenWidth/2-ccoffset;
        self.deckViewController.topSize = screenHeight/2-ccoffset;
        self.deckViewController.bottomSize = screenHeight/2-ccoffset;
        self.deckViewController.shadowEnabled = false;
        self.deckViewController.openSlideAnimationDuration = 1.2f;
        self.deckViewController.closeSlideAnimationDuration = 1.2f;
        self.deckViewController.delegate = self;
    }
    return self.deckViewController;
}

- (void)setBgColor:(UIColor*) bgColor{
    for (WRFiveViewController *controller in self.fiveVewControllers) {
        controller.bgColor = bgColor;
    }
}


# pragma IIDeckViewController Delegate Method

- (void)viewDeckController:(IIViewDeckController*)viewDeckController willOpenViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated{
    //NSLog(@"vdc: %u\n",(unsigned int)viewDeckSide);
    
    switch (viewDeckSide) {
        case IIViewDeckLeftSide:{
            LeftViewController *leftViewController = (LeftViewController*)viewDeckController.leftController;
            [leftViewController presentViewContent];
            break;
        }case IIViewDeckRightSide:{
            
            break;
        }case IIViewDeckTopSide:{
            
            break;
        }case IIViewDeckBottomSide:{
            
            break;
        }default:{
            break;
        }
    }
}

- (void)viewDeckController:(IIViewDeckController *)viewDeckController willCloseViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated{
    switch (viewDeckSide) {
        case IIViewDeckLeftSide:{
            LeftViewController *leftViewController = (LeftViewController*)viewDeckController.leftController;
            [leftViewController hideViewContent];
            break;
        }case IIViewDeckRightSide:{
            
            break;
        }case IIViewDeckTopSide:{
            
            break;
        }case IIViewDeckBottomSide:{
            
            break;
        }default:{
            break;
        }
    }
}

@end