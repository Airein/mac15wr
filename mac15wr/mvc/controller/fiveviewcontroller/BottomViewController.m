//
//  BottomViewController.m
//  mac15wr
//
//  Created by zwein on 2/14/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import "BottomViewController.h"

@interface BottomViewController (){
    CGPoint containerCenter;
}

@end

@implementation BottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.containerView = [[UIView alloc] init];
    self.containerView.frame = CGRectMake(20, 100, SCREEN_WIDTH-40, SCREEN_HEIGHT - 100);
//    self.containerView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2 + 40);
    containerCenter = self.containerView.center;
    self.containerView.center = CGPointMake(containerCenter.x, containerCenter.y + CGRectGetHeight(self.containerView.frame));
    self.containerView.backgroundColor = [UIColor WR_USC_Yellow];
    self.containerView.layer.cornerRadius = 24.0;
    
    
    UILabel *searchLabel = [[UILabel alloc] init];
    searchLabel.frame = CGRectMake(0, 0, 300, 180);
    searchLabel.center = CGPointMake(CGRectGetWidth(self.containerView.frame)/2, CGRectGetHeight(self.containerView.frame)/2);
    searchLabel.text = @"Search Function Implemented \nin Android sdie";
    searchLabel.font = [UIFont boldSystemFontOfSize:24.f];
    searchLabel.textAlignment = NSTextAlignmentCenter;
    searchLabel.textColor = [UIColor WR_USC_Red];
    searchLabel.lineBreakMode = NSLineBreakByWordWrapping;
    searchLabel.numberOfLines = 0;
    [self.containerView addSubview:searchLabel];

    [self.view addSubview:self.containerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) presentViewContent{
    [UIView animateWithDuration:FIVEPAGE_TRANSITION_DURATION animations:^{
        //[UIView setAnimationDelay:1.2];//配置动画时延
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        self.containerView.center = containerCenter;//CGPointMake(bgCenter.x + 100, bgCenter.y);
        [self.containerView setAlpha:1.0];
        
    } completion:^(BOOL finished) {
        //执行完后走这里的代码块
    }];
    
}


-(void) hideViewContent{
    [UIView animateWithDuration:FIVEPAGE_TRANSITION_DURATION animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        self.containerView.center = CGPointMake(containerCenter.x, containerCenter.y + CGRectGetHeight(self.containerView.frame));
        [self.containerView setAlpha:0.2];
        
    } completion:^(BOOL finished) {
        //执行完后走这里的代码块
    }];
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
