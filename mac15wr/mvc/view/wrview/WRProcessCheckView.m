//
//  WRProcessCheckView.m
//  mac15wr
//
//  Created by zwein on 2/16/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import "WRProcessCheckView.h"

#import "WRDemoViewController.h"    // Demo for developer guide

@implementation WRProcessCheckView


- (id) initWithCVType:(NSString*) cvType {
    
    self = [super init];
    //self.translatesAutoresizingMaskIntoConstraints = NO;
    self.backgroundColor = [UIColor colorWithIntegerRed:213 green:76 blue:60 alpha:0.9];
    self.layer.cornerRadius = 12.0;
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH-55, SCREEN_WIDTH-55);
    self.cvTypeString = cvType;
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.clipsToBounds = YES;
    _titleLabel.layer.cornerRadius = 6.0;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont boldSystemFontOfSize:24.0];
    _titleLabel.text = @"Hello";
    _titleLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH-55, 50);
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    
    
    _dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _dismissButton.contentEdgeInsets = UIEdgeInsetsMake(10, 20, 10, 20);
    _dismissButton.backgroundColor = [UIColor pomegranateColor];
    [_dismissButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_dismissButton setTitleColor:[[_dismissButton titleColorForState:UIControlStateNormal] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    _dismissButton.titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
    [_dismissButton setTitle:@"Close" forState:UIControlStateNormal];
    _dismissButton.layer.cornerRadius = 6.0;
    [_dismissButton addTarget:self action:@selector(dismissButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    _dismissButton.frame = CGRectMake(0, SCREEN_WIDTH-95, SCREEN_WIDTH-55, 40);
    [self addSubview:_dismissButton];
    
    
    // Data Source
    _checklistContent = [[NSMutableArray alloc] init];
    
    if ([self.cvTypeString isEqualToString:@"first"]) {
        _titleLabel.text = @"Tutorial";
        [_checklistContent addObjectsFromArray:[[NSArray alloc] initWithObjects:
                                                @"a) Overview Tour",
                                                @"b) Team Member",
                                                nil]];
    } else if ([self.cvTypeString isEqualToString:@"second"]) {
        _titleLabel.text = @"Viewer";
        [_checklistContent addObjectsFromArray:[[NSArray alloc] initWithObjects:
                                                @"a) Course in USC",
                                                @"b) Course Requirement",
                                                @"c) Course Recommendation",
                                                @"d) Registration",
                                                nil]];
    } else if ([self.cvTypeString isEqualToString:@"third"]) {
        _titleLabel.text = @"Chooser";
        [_checklistContent addObjectsFromArray:[[NSArray alloc] initWithObjects:
                                                @"a) Choose course",
                                                @"b) Check wish lish",
                                                @"c) Check reminder",
                                                @"d) Check checkout list",
                                                @"e) View calendar",
                                                @"f) Compare Calendars",
                                                @"g) Check Credits",
                                                nil]];
    } else if ([self.cvTypeString isEqualToString:@"fourth"]) {
        _titleLabel.text = @"Register";
        [_checklistContent addObjectsFromArray:[[NSArray alloc] initWithObjects:
                                                @"a) Course Examination Report",
                                                @"b) DC Requester",
                                                @"b) Checkout and Pay",
                                                nil]];
    } else if ([self.cvTypeString isEqualToString:@"fifth"]) {
        _titleLabel.text = @"Planner";
        [_checklistContent addObjectsFromArray:[[NSArray alloc] initWithObjects:
                                                @"a) Overview Report",
                                                @"b) Statistical Report",
                                                @"c) Plan Course",
                                                nil]];
    }

    
    // Data Table
    _checklistTable = [[UITableView alloc] init];
    _checklistTable.frame = CGRectMake(0, 50, SCREEN_WIDTH-55, SCREEN_WIDTH-145);
    _checklistTable.separatorColor = [UIColor clearColor];
    _checklistTable.alpha = 0.9;
    _checklistTable.backgroundColor = [UIColor alizarinColor];
    _checklistTable.delegate = self;
    _checklistTable.dataSource = self;
    //_checklistTable.dataSource = _checklistContent;
    [self addSubview:_checklistTable];
    
//
//    
//    _descLabel = [[UILabel alloc] init];
//    _descLabel.backgroundColor = [UIColor pomegranateColor];
//    _descLabel.clipsToBounds = YES;
//    _descLabel.layer.cornerRadius = 6.0;
//    _descLabel.textColor = [UIColor whiteColor];
//    _descLabel.font = [UIFont boldSystemFontOfSize:24.0];
//    _descLabel.text = @"Description";
//    _descLabel.frame = CGRectMake(0, SCREEN_WIDTH-25, SCREEN_WIDTH-55, 40);
//    _descLabel.textAlignment = NSTextAlignmentCenter;
//    [self addSubview:_descLabel];
//
    
    
    return self;
}

- (void)dismissButtonPressed:(id)sender {
    if ([sender isKindOfClass:[UIView class]]) {
        [(UIView*)sender dismissPresentingPopup];
    }
}


#pragma mark - Table View Data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return [self.checklistContent count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"WRChecklistContent";
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
//                             cellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:
//                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//        cell.textLabel.textColor = [UIColor cloudsColor];
//        cell.backgroundColor = [UIColor alizarinColor];
//        cell.textLabel.font = [UIFont boldSystemFontOfSize:20.0];
//
//    }
    TDBadgedCell *cell =[[TDBadgedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    cell.textLabel.textColor = [UIColor cloudsColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
    cell.backgroundColor = [UIColor alizarinColor];
    cell.badgeString = @"checked";
    cell.badgeColor = [UIColor sunflowerColor];
    cell.badgeTextColor = [UIColor pomegranateColor];
    //cell.badge.radius = 9;
    cell.badge.fontSize = 13;
    cell.badge.boldFont = YES;
    cell.badge.layer.borderWidth = 0;
    cell.badge.layer.borderColor = [UIColor whiteColor].CGColor;
    

    
    
    NSString *stringForCell = [self.checklistContent objectAtIndex:indexPath.row];
    //NSLog(@"%@", stringForCell);
    [cell.textLabel setText:stringForCell];
    return cell;
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
//(NSInteger)section{
//    NSString *headerTitle;
//    if (section==0) {
//        headerTitle = @"Section 1 Header";
//    }
//    else{
//        headerTitle = @"Section 2 Header";
//        
//    }
//    return headerTitle;
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:
//(NSInteger)section{
//    NSString *footerTitle;
//    if (section==0) {
//        footerTitle = @"Section 1 Footer";
//    }
//    else{
//        footerTitle = @"Section 2 Footer";
//        
//    }
//    return footerTitle;
//}

/**
 *  Process the action user choosed
 *
 *  @param index the action index in the table
 */
-(void) handleCheckViewAction:(NSInteger)index{
    
    UIViewController *actionViewController = NULL;
    
    if ([self.cvTypeString isEqualToString:@"first"]) {     // Tutorial
        switch (index) {
            case 0:{    //  Overview Tour
                actionViewController = [[WRDemoViewController alloc] init];
                
                break;
            } case 1:{  //  Team Member
                NSLog(@"1");
                break;
            } case 2:{  //  Course in USC
                
                break;
            } case 3:{
                
                break;
            }  default:{
                break;
            }
        }
    } else if ([self.cvTypeString isEqualToString:@"second"]) {     //  Viewer
        switch (index) {
            case 0:{
                NSLog(@"0");
                break;
            } case 1:{
                NSLog(@"1");
                break;
            } case 2:{
                
                break;
            } case 3:{
                
                break;
            }  default:{
                break;
            }
        }
    } else if ([self.cvTypeString isEqualToString:@"third"]) {      //  Chooser
        switch (index) {
            case 0:{
                NSLog(@"0");
                break;
            } case 1:{
                NSLog(@"1");
                break;
            } case 2:{
                
                break;
            } case 3:{
                
                break;
            }  default:{
                break;
            }
        }
    } else if ([self.cvTypeString isEqualToString:@"fourth"]) {     //  Register
        switch (index) {
            case 0:{
                NSLog(@"0");
                break;
            } case 1:{
                NSLog(@"1");
                break;
            } case 2:{
                
                break;
            } case 3:{
                
                break;
            }  default:{
                break;
            }
        }
    } else if ([self.cvTypeString isEqualToString:@"fifth"]) {      //  Planner
        switch (index) {
            case 0:{
                NSLog(@"0");
                break;
            } case 1:{
                NSLog(@"1");
                break;
            } case 2:{
                
                break;
            } case 3:{
                
                break;
            }  default:{
                break;
            }
        }
    }
    
    //UIViewController *newController = [[UIViewController alloc] init];
    actionViewController.view.backgroundColor = [UIColor wetAsphaltColor];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:actionViewController];
    [navController.navigationBar configureFlatNavigationBarWithColor:[UIColor midnightBlueColor]];
    
    self.klcPopupDelegate.dismissType = KLCPopupDismissTypeBounceOut;
    [self.klcPopupDelegate dismiss:YES];
    
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromTop;
    [self.parentControllerDelegate.view.layer addAnimation:transition forKey:kCATransition];
    [self.parentControllerDelegate presentViewController:navController animated:YES completion:nil];
    
}

#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.highlightedTextColor = [UIColor pomegranateColor];
    //cell.backgroundColor = [UIColor pomegranateColor];
//    NSLog(@"Section:%d Row:%d selected and its data is %@",
//          indexPath.section,indexPath.row,cell.textLabel.text);
    
    [self handleCheckViewAction: indexPath.row];
    
    
    
    
    
    
    
//    [self.parentControllerDelegate presentViewController:navController animated:YES completion:^{
//        
//    }];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




@end
