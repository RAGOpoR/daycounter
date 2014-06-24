//
//  CGTaskTableViewController.m
//  DayCounter
//
//  Created by Puriphan Sawutudomphon on 6/14/2557 BE.
//  Copyright (c) 2557 Puriphan Sawutudomphon. All rights reserved.
//

#import "CGTaskTableViewController.h"
#import "CGCounter.h"
#import "CGAddCounterViewController.h"
#import "CGEditCounterViewController.h"

@interface CGTaskTableViewController ()

@end

@implementation CGTaskTableViewController

@synthesize counters = _counters;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.counters = [[NSMutableArray alloc]init];
    
    /*
    CGCounter *icounter = [[CGCounter alloc] initWithName:@"Interested" done:YES];
    
    [self.counters addObject:icounter];
    
    CGCounter *nicounter = [[CGCounter alloc]initWithName:@"Not Interested" done:NO];
    
    [self.counters addObject:nicounter];
    
    [self.tableView reloadData];
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddCounterSegue"])
    {
        UINavigationController *navCon =segue.destinationViewController;
        
        CGAddCounterViewController *addCounterViewController = [navCon.viewControllers objectAtIndex:0];
        addCounterViewController.counterListViewController = self;
    }
    else if ([segue.identifier isEqualToString:@"InterestedTaskSegue"] || [segue.identifier isEqualToString:@"NotInterestedTaskSegue"])
    {
        CGEditCounterViewController *editCounterViewController = segue.destinationViewController;
        editCounterViewController.counter = [self.counters objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.counters.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *IntCellIdentifier = @"InterestedTaskCell";
    static NSString *NotIntCellIdentifier = @"NotInterestedTaskCell";
    
    CGCounter *currentCounter = [self.counters objectAtIndex:indexPath.row];
    
    NSString *cellIdentifier = currentCounter.done ? IntCellIdentifier : NotIntCellIdentifier;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Configure the cell...
    
    cell.textLabel.text = currentCounter.description;
    
    return cell;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.counters removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
