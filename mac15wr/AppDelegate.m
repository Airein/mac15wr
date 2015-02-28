//
//  AppDelegate.m
//  mac15wr
//
//  Created by zwein on 15/2/7.
//  Copyright (c) 2015年 mac15wr. All rights reserved.
//

#import "AppDelegate.h"
#import <GooglePlus/GooglePlus.h>
#import <GoogleOpenSource/GoogleOpenSource.h>
#import "WRFiveViewManager.h"
#import "SRFSurfboard.h"
#import "WRRealmUsers.h"
#import "WRLoginViewController.h"
#import "WRCourse.h"



@interface AppDelegate ()<SRFSurfboardDelegate>
@property GPPSignIn *signIn;
@end


@implementation AppDelegate

// Please use the client ID created for you by Google.
static NSString * const kClientID =
@"505486916113-8mdlode4utlqdoq7vr83l0ric7g5h6r9.apps.googleusercontent.com";


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
    self.window.rootViewController = surfboard;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    //google+ login
    GPPSignIn *signin=[GPPSignIn sharedInstance];
    signin.clientID=kClientID;
    signin.scopes=@[kGTLAuthScopePlusLogin];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [GPPURLHandler handleURL:url
                  sourceApplication:sourceApplication
                         annotation:annotation];
}

#pragma mark - GPPDeepLinkDelegate

- (void)didReceiveDeepLink:(GPPDeepLink *)deepLink {
    // An example to handle the deep link data.
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Deep-link Data"
                          message:[deepLink deepLinkID]
                          delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
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
            WRFiveViewManager *wrFiveViewManager = [WRFiveViewManager sharedInstance];
            [wrFiveViewManager setBgColor:[UIColor pomegranateColor]];
            IIViewDeckController *deckViewController = [wrFiveViewManager getDeckController];
            self.window.rootViewController = deckViewController;
    
    
//    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    UIViewController *myView = [story instantiateViewControllerWithIdentifier:@"loginStory"];
//    self.window.rootViewController = myView;
    
}

- (void) entermainpage{
    WRFiveViewManager *wrFiveViewManager = [WRFiveViewManager sharedInstance];
    [wrFiveViewManager setBgColor:[UIColor pomegranateColor]];
    IIViewDeckController *deckViewController = [wrFiveViewManager getDeckController];
    
    
    if (self.signIn.userEmail) {
        if ([WRRealmUsers objectsWhere:@"email=%@",self.signIn.userEmail]) {
            self.window.rootViewController = deckViewController;
        }
        WRRealmUsers* users=[[WRRealmUsers alloc] init];
        RLMRealm *realm=[RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        users.email=self.signIn.userEmail;
        users.idToken=self.signIn.idToken;
        [realm addObject:users];
        [realm commitWriteTransaction];
    }
    
    
    
    self.window.rootViewController = deckViewController;
}


- (void)surfboard:(SRFSurfboardViewController *)surfboard didShowPanelAtIndex:(NSInteger)index
{
    //    NSLog(@"Index: %i", index);
}

- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
                   error: (NSError *) error {
    if (error) {
        // Do some error handling here.
        NSLog(@"Error");
        [self.signIn authenticate];
    } else {
        NSLog(@"Successful Login");
        
        WRFiveViewManager *wrFiveViewManager = [WRFiveViewManager sharedInstance];
        [wrFiveViewManager setBgColor:[UIColor pomegranateColor]];
        IIViewDeckController *deckViewController = [wrFiveViewManager getDeckController];
        
        
        //store user_info
        if (self.signIn.userEmail) {
            if ([WRRealmUsers objectsWhere:@"email=%@",self.signIn.userEmail]) {
                self.window.rootViewController = deckViewController;
            }
            WRRealmUsers* users=[[WRRealmUsers alloc] init];
            RLMRealm *realm=[RLMRealm defaultRealm];
            [realm beginWriteTransaction];
            users.email=self.signIn.userEmail;
            users.idToken=self.signIn.idToken;
            [realm addObject:users];
            [realm commitWriteTransaction];
        }
        
        
        
        
        self.window.rootViewController = deckViewController;
    }
}


@end
