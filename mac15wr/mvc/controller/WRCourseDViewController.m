//
//  WRCourseDViewController.m
//  mac15wr
//
//  Created by Alex on 2/25/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import "WRCourseDViewController.h"
#import "WRDescTableViewCell.h"

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
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sections"];
        cell.textLabel.text=[[self.sections objectAtIndex:indexPath.row-1] valueForKey:@"location"];
        return cell;
        
    }
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 140;
    }
    else {
        return 52;
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
    
}



@end
