//
//  CGAddCounterViewController.m
//  DayCounter
//
//  Created by Puriphan Sawutudomphon on 6/14/2557 BE.
//  Copyright (c) 2557 Puriphan Sawutudomphon. All rights reserved.
//

#import "CGAddCounterViewController.h"
#import "CGTaskTableViewController.h"
#import "CGCounter.h"

@interface CGAddCounterViewController ()

@end

@implementation CGAddCounterViewController

@synthesize descField = _descField;
@synthesize inputDate = _inputDate;
@synthesize inputTime = _inputTime;

@synthesize counterListViewController = _counterListViewController;

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
    
    /*
    NSDateFormatter *dataFormatD = [[NSDateFormatter alloc] init];
    [dataFormatD setDateFormat:@"dd-MM-YYYY"];
    NSDateFormatter *dataFormatT = [[NSDateFormatter alloc] init];
    [dataFormatT setDateFormat:@"HH-mm-ss"];
    */
    
    UIDatePicker *dp = [[UIDatePicker alloc]init];
    [dp setDatePickerMode:UIDatePickerModeDate];
    [dp addTarget:self action:@selector(datePickerCallback) forControlEvents:UIControlEventValueChanged];
    _inputDate.inputView = dp;
    
    UIDatePicker *tp = [[UIDatePicker alloc]init];
    [tp setDatePickerMode:UIDatePickerModeTime];
    [tp addTarget:self action:@selector(timePickerCallback) forControlEvents:UIControlEventValueChanged];
    _inputTime.inputView = tp;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:true];
}

#pragma mark - IBActions

- (IBAction)cancelButtonPressed:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)doneButtonPressed:(UIBarButtonItem *)sender
{
    CGCounter *newCounter = [[CGCounter alloc]initWithName:self.descField.text done:YES];
    
    [self.counterListViewController.counters addObject:newCounter];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //[self.counterListViewController.tableView reloadData];

}

- (void)datePickerCallback
{
    NSDateFormatter *formatterDate = [[NSDateFormatter alloc]init];
    [formatterDate setDateFormat:@"dd  MMMM  yyyy"];
    _inputDate.text = [formatterDate stringFromDate:[NSDate date]];
    
    
    //_inputDate.text = @"date";
}

- (void)timePickerCallback
{
    NSDateFormatter *formatterTime = [[NSDateFormatter alloc]init];
    [formatterTime setDateFormat:@"HH:mm:ss"];
    _inputTime.text = [formatterTime stringFromDate:[NSDate date]];
    
    //_inputTime.text = @"time";
}

#pragma mark PickerView DataSource

//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
//    return 1;
//}

//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
//    return _countryNames.count;
//}
//
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row  forComponent:(NSInteger)component {
//    return _countryNames[row];
//}

#pragma mark PickerView Delegate
//-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    float rate = [_exchangeRates[row] floatValue];
//    float dollars = [_dollarText.text floatValue];
//    float result = dollars * rate;
//    
//    NSString *resultString = [[NSString alloc] initWithFormat:
//                              @"%.2f USD = %.2f %@", dollars, result,
//                              _countryNames[row]];
//    _resultLabel.text = resultString;
//}
@end
