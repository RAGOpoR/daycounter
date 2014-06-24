//
//  CGAddCounterViewController.h
//  DayCounter
//
//  Created by Puriphan Sawutudomphon on 6/14/2557 BE.
//  Copyright (c) 2557 Puriphan Sawutudomphon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CGTaskTableViewController;

@interface CGAddCounterViewController : UITableViewController <UIPickerViewDelegate, UIPickerViewDataSource>

- (IBAction)cancelButtonPressed:(UIBarButtonItem *)sender;

- (IBAction)doneButtonPressed:(UIBarButtonItem *)sender;

@property (strong, nonatomic) IBOutlet UITextField *descField;

@property (nonatomic, strong) CGTaskTableViewController * counterListViewController;

@property (strong, nonatomic) IBOutlet UITextField *inputDate;

@property (strong, nonatomic) IBOutlet UITextField *inputTime;

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@end
