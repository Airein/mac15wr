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
//    [UIBarButtonItem configureFlatButtonsWithColor:[UIColor peterRiverColor]
//                                  highlightedColor:[UIColor belizeHoleColor]
//                                      cornerRadius:3
//                                   whenContainedIn:[WRDemoViewController class], nil];
    
    UIImage *image = [UIImage imageNamed:@"nbi_menu"];
    CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);
    
    //init a normal UIButton using that image
    UIButton* button = [[UIButton alloc] initWithFrame:frame];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setShowsTouchWhenHighlighted:YES];
    
    //set the button to handle clicks - this one calls a method called 'downloadClicked'
    [button addTarget:self action:@selector(closeButtonPressed) forControlEvents:UIControlEventTouchDown];
    
    //finally, create your UIBarButtonItem using that button
    UIBarButtonItem* closeBtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    
//    UIBarButtonItem *closeBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nbi_menu"] style:UIBarButtonItemStylePlain target:self action:@selector(pressedAction)];
    [self.navigationController.navigationItem setRightBarButtonItem:closeBtn];


}

-(void) closeButtonPressed{
    
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
