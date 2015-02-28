//
//  WRDeptListTableViewController.m
//  mac15wr
//
//  Created by Alex on 2/28/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import "WRDeptListTableViewController.h"
#import "WRCourseTableViewController.h"

@interface WRDeptListTableViewController ()
@property RLMResults* deptlist;
@end

@implementation WRDeptListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.deptlist=[WRRealmDeptList objectsWhere:@"SchoolAbb=%@",self.schoolAbb];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.deptlist count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"depts" forIndexPath:indexPath];
    
    // Configure the cell...
    WRRealmDeptList* dept=[self.deptlist objectAtIndex:indexPath.row];
    cell.textLabel.text=dept.DeptName;
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"toCourse"]) {
        WRRealmDeptList *dept=[self.deptlist objectAtIndex:[[self.tableview indexPathForSelectedRow] row]];
        
        
        RLMRealm *realm=[RLMRealm defaultRealm];
        NSString *courseString=[WRFetchData getCourseInSpecificTerm:@"20151" andDept:dept.DeptAbb];
        [[WRAPIClient sharedClient] GET:courseString parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
            NSMutableArray* mutableCourses = [NSMutableArray arrayWithCapacity:[JSON count]];
            [realm beginWriteTransaction];
            
            
            for (NSDictionary *course_attributes in JSON) {
                WRCourse *course = [[WRCourse alloc] initWithAttributes:course_attributes];
                
                if ([WRRealmCourse objectsWhere:@"sis_course_id=%@",course.sis_course_id].count) {
                    continue;
                }
                
                
                WRRealmCourse *newcourse=[[WRRealmCourse alloc] init];
                newcourse.course_id=course.course_id;
                newcourse.sis_course_id=course.sis_course_id;
                newcourse.title=course.title;
                newcourse.min_units=course.min_units;
                newcourse.max_units=course.max_units;
                newcourse.total_max_units=course.total_max_units;
                newcourse.desc=course.desc;
                newcourse.diversity_flag=course.diversity_flag;
                newcourse.effective_term_code=course.effective_term_code;
                newcourse.section=[NSKeyedArchiver archivedDataWithRootObject:course.section];
                [realm addObject:newcourse];
                [mutableCourses addObject:course];
            }
            
            
            [realm commitWriteTransaction];
            
        } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
            
        }];
        
        
        
    }
    
    
}


@end
