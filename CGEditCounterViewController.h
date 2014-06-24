//
//  CGEditCounterViewController.h
//  DayCounter
//
//  Created by Puriphan Sawutudomphon on 6/15/2557 BE.
//  Copyright (c) 2557 Puriphan Sawutudomphon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CGCounter;

@interface CGEditCounterViewController : UITableViewController

- (IBAction)counterDataChanged:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *descField;

@property (strong, nonatomic) IBOutlet UITextField *dateField;

@property (strong, nonatomic) IBOutlet UITextField *timeField;

@property (strong, nonatomic) IBOutlet UISwitch *interestedSwitch;

@property (nonatomic, strong) CGCounter *counter;

@end
