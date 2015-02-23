//
//  LeftViewController.m
//  mac15wr
//
//  Created by zwein on 2/14/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor emerlandColor];
    self.contentView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    self.contentView.alpha = 0.3;
    self.contentView.center = CGPointMake(-CGRectGetMidX(self.view.bounds), [[UIScreen mainScreen] bounds].size.height/2);

    
    UILabel *lbl = [[UILabel alloc] init];
    lbl.frame = CGRectMake(self.contentView.bounds.origin.x, self.contentView.bounds.size.height/2, 300, 100);
    lbl.text = @"Hello";
    [self.contentView addSubview:lbl];
    
    [self.view addSubview:self.contentView];
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

-(void) presentViewContent{
    
//    UIViewAnimationOptions uioptions = UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionBeginFromCurrentState;
//    options |= [self isSideOpen:side] ? UIViewAnimationOptionCurveEaseInOut : UIViewAnimationOptionCurveEaseOut;
  
//    [UIView beginAnimations:@"ChangeAlphaAnimation" context:NULL];
//    [UIView setAnimationDuration:2.0];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [self.contentView setAlpha:0.2];
//    [UIView setAnimationDelegate:self];
//    //[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
//    [UIView commitAnimations];
    
    [UIView animateWithDuration:1.2 animations:^{
        //[UIView setAnimationDelay:1.2];//配置动画时延
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        self.contentView.center = CGPointMake(CGRectGetMidX([[UIScreen mainScreen] bounds]), CGRectGetMidY([[UIScreen mainScreen] bounds]));
        [self.contentView setAlpha:1.0];
        //self.contentView.center = CGPointMake(0,0);//可以对多个view进行我们想要的动画配置
        //newView.center = CGPointMake(X,Y);
        
    } completion:^(BOOL finished) {
        //执行完后走这里的代码块
    }];

}


-(void) hideViewContent{
    [UIView animateWithDuration:1.2 animations:^{
        //[UIView setAnimationDelay:1.2];//配置动画时延
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        self.contentView.center = CGPointMake(-CGRectGetMidX([[UIScreen mainScreen] bounds]), CGRectGetMidY([[UIScreen mainScreen] bounds]));
        [self.contentView setAlpha:0.2];
        //self.contentView.center = CGPointMake(0,0);//可以对多个view进行我们想要的动画配置
        //newView.center = CGPointMake(X,Y);
        
    } completion:^(BOOL finished) {
        //执行完后走这里的代码块
    }];
}





@end
