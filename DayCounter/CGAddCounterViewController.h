//
//  CGAddCounterViewController.h
//  DayCounter
//
//  Created by Puriphan Sawutudomphon on 6/14/2557 BE.
//  Copyright (c) 2557 Puriphan Sawutudomphon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CGTaskTableViewController;

@interface CGAddCounterViewController : UITableViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    NSDate *inputDate;
    NSDate *inputTime;
    
    UIActionSheet *dateSheet;
}

- (IBAction)cancelButtonPressed:(UIBarButtonItem *)sender;

- (IBAction)doneButtonPressed:(UIBarButtonItem *)sender;

@property (strong, nonatomic) IBOutlet UITextField *descField;

@property (strong, nonatomic) CGTaskTableViewController * counterListViewController;

@property (strong, nonatomic) IBOutlet UITextField *dateTextField;

@property (strong, nonatomic) IBOutlet UITextField *timeTextField;

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (retain, nonatomic) NSDate *inputDate;

@property (retain, nonatomic) NSDate *inputTime;

@property (strong, nonatomic) IBOutlet UILabel *toDay;

@end
