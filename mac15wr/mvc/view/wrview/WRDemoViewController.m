//
//  WRDemoViewController.m
//  mac15wr
//
//  Created by zwein on 2/22/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import "WRDemoViewController.h"

@interface WRDemoViewController ()

@end

@implementation WRDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor midnightBlueColor]];
//    [UIBarButtonItem configureFlatButtonsWithColor:[UIColor peterRiverColor]
//                                  highlightedColor:[UIColor belizeHoleColor]
//                                      cornerRadius:3
//                                   whenContainedIn:[WRDemoViewController class], nil];
    
    UIImage *image = [UIImage imageNamed:@"nbi_close"];
    CGRect frame = CGRectMake(SCREEN_WIDTH-image.size.width-10, 10, image.size.width, image.size.height);
    
    //init a normal UIButton using that image
    UIButton* button = [[UIButton alloc] initWithFrame:frame];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setShowsTouchWhenHighlighted:YES];
    
    //set the button to handle clicks - this one calls a method called 'downloadClicked'
    [button addTarget:self action:@selector(closeButtonPressed) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:button];
}

-(void) closeButtonPressed{
    NSLog(@"close");
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromLeft;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
