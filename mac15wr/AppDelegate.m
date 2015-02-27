//
//  AppDelegate.m
//  mac15wr
//
//  Created by zwein on 15/2/7.
//  Copyright (c) 2015年 mac15wr. All rights reserved.
//

#import "AppDelegate.h"
#import "WRFiveViewManager.h"
#import "SRFSurfboard.h"


@interface AppDelegate ()<SRFSurfboardDelegate>

@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setStatusBarHidden: YES];
    
    WRLOG_INIT  //  Initial Log Method
    //    DDLogVerbose(@"Verbose");
    //    DDLogDebug(@"Debug");
    //    DDLogInfo(@"Info");
    //    DDLogWarn(@"Warn");
    //    DDLogError(@"Error");
    
    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    WRFiveViewManager *wrFiveViewManager = [WRFiveViewManager sharedInstance];
//    [wrFiveViewManager setBgColor:[UIColor pomegranateColor]];
//    IIViewDeckController *deckViewController = [wrFiveViewManager getDeckController];
//    self.window.rootViewController = deckViewController;
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"panels" ofType:@"json"];
    NSArray *panels = [SRFSurfboardViewController panelsFromConfigurationAtPath:path];
    SRFSurfboardViewController *surfboard = [[SRFSurfboardViewController alloc] initWithPathToConfiguration:path];
    [surfboard setPanels:panels];
    surfboard.delegate = self;
    surfboard.backgroundColor = [UIColor WR_USC_Yellow];

    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    WRWelcomeViewController *wrFiveViewManager = [[WRWelcomeViewController alloc] init];
    self.window.rootViewController = surfboard;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/**
 *  Handle SRFSurfboardView Action
 */
- (void)surfboard:(SRFSurfboardViewController *)surfboard didTapButtonAtIndexPath:(NSIndexPath *)indexPath
{
    //        WRFiveViewManager *wrFiveViewManager = [WRFiveViewManager sharedInstance];
    //        [wrFiveViewManager setBgColor:[UIColor pomegranateColor]];
    //        IIViewDeckController *deckViewController = [wrFiveViewManager getDeckController];
    //        self.window.rootViewController = deckViewController;
    
    
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *myView = [story instantiateViewControllerWithIdentifier:@"loginStory"];
    self.window.rootViewController = myView;
    
}

- (void)surfboard:(SRFSurfboardViewController *)surfboard didShowPanelAtIndex:(NSInteger)index
{
    //    NSLog(@"Index: %i", index);
}


@end
