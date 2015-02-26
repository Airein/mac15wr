//
//  WRCourseDViewController.m
//  mac15wr
//
//  Created by Alex on 2/25/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import "WRCourseDViewController.h"
#import "WRDescTableViewCell.h"
#import "WRSectionTableViewCell.h"

@implementation WRCourseDViewController


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.sections count]+1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sections" forIndexPath:indexPath];
    // Configure the cell...
    
    if (indexPath.row==0) {
        //show description
        WRDescTableViewCell *celldesc = [tableView dequeueReusableCellWithIdentifier:@"desc"];
        celldesc.descLabel.text=self.courseSelected.desc;
        CGSize labelSize = [celldesc.descLabel.text sizeWithAttributes:@{NSFontAttributeName:celldesc.descLabel.font}];
        
        celldesc.descLabel.frame = CGRectMake(
                                 celldesc.descLabel.frame.origin.x, celldesc.descLabel.frame.origin.y,
                                 celldesc.descLabel.frame.size.width, labelSize.height);
        return celldesc;
    }else{
        WRSectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sections"];
        cell.classNumLabel.text=[[self.sections objectAtIndex:indexPath.row-1] valueForKey:@"uSectionID"];
        //seat,registered,waiting
        NSString *srw=[[NSString alloc] initWithFormat:@"S%@/R%@/W%@", [[self.sections objectAtIndex:indexPath.row-1] valueForKey:@"seats"],[[self.sections objectAtIndex:indexPath.row-1] valueForKey:@"registered"],@"0"];
        cell.srwLabel.text=srw;
        cell.roomLabel.text=[[self.sections objectAtIndex:indexPath.row-1] valueForKey:@"location"];
        NSString *seTime=[[NSString alloc] initWithFormat:@"%@-%@",[[self.sections objectAtIndex:indexPath.row-1] valueForKey:@"bTime"],[[self.sections objectAtIndex:indexPath.row-1] valueForKey:@"eTime"]];
        cell.hoursLabel.text=seTime;
        cell.instractorLabel.text=[[self.sections objectAtIndex:indexPath.row-1] valueForKey:@"instructor"];
        cell.dayLabel.text=[[self.sections objectAtIndex:indexPath.row-1] valueForKey:@"day"];
        
        //classtype
        cell.courseTypeLabel.text=@"Lec";
        
        
        
        return cell;
        
    }
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 140;
    }
    else {
        return 100;
    }
}



-(void)viewDidLoad {
    self.courseTitleLabel.text=self.courseSelected.title;
//    self.creditLabel.text=[NSString stringWithFormat:@"%.0f", self.courseSelected.min_units];
//    self.descLabel.text=self.courseSelected.desc;
    self.courseIDLabel.text=self.courseSelected.sis_course_id;
    
    
    
    self.sections=[[NSMutableArray alloc] init];
    for (NSDictionary *dict in self.courseSelected.section) {
        [self.sections addObject:dict];
    }
    
    
    UIView * separator = [[UIView alloc] initWithFrame:CGRectMake(0, 235, 600, 0.5)];
    separator.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    [self.view addSubview:separator];
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    v.backgroundColor = [UIColor clearColor];
    [self.tableview setTableFooterView:v];
    
}



@end
