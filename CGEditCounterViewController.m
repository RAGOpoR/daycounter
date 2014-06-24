//
//  CGEditCounterViewController.m
//  DayCounter
//
//  Created by Puriphan Sawutudomphon on 6/15/2557 BE.
//  Copyright (c) 2557 Puriphan Sawutudomphon. All rights reserved.
//

#import "CGEditCounterViewController.h"
#import "CGCounter.h"

@interface CGEditCounterViewController ()

@end

@implementation CGEditCounterViewController

@synthesize descField = _descField;
@synthesize dateField = _dateField;
@synthesize timeField = _timeField;
@synthesize counter = _counter;
@synthesize interestedSwitch = _interestedSwitch;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
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
    
    NSDateFormatter *dataFormatD = [[NSDateFormatter alloc] init];
    [dataFormatD setDateFormat:@"dd-MM-YYYY"];
    NSDateFormatter *dataFormatT = [[NSDateFormatter alloc] init];
    [dataFormatT setDateFormat:@"HH-mm"];
    // Picker
    UIDatePicker *dp = [[UIDatePicker alloc]init];
    [dp setDatePickerMode:UIDatePickerModeDate];
    _dateField.inputView = dp;
    UIDatePicker *tp = [[UIDatePicker alloc]init];
    [tp setDatePickerMode:UIDatePickerModeTime];
    _timeField.inputView = tp;
    
    self.descField.text = self.counter.description;
    self.dateField.text = self.counter.date;
    self.timeField.text = self.counter.time;
    [self.interestedSwitch setOn:self.counter.done];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - IBActions

- (void)counterDataChanged:(id)sender
{
    self.counter.description = self.descField.text;
    self.counter.done = self.interestedSwitch.isOn;
    self.counter.date = self.dateField.text;
    self.counter.time = self.timeField.text;
}

@end
