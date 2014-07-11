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
@synthesize dateTextField = _dateTextField;
@synthesize timeTextField = _timeTextField;

@synthesize inputDate;
@synthesize inputTime;

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
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd / MMMM / YYYY            HH:mm:ss "];
    [_toDay setText:[dateFormatter stringFromDate:[NSDate date]]];
    
    dateSheet = [[UIActionSheet alloc]initWithTitle:nil
                                           delegate:nil
                                  cancelButtonTitle:nil
                             destructiveButtonTitle:nil
                                  otherButtonTitles:nil];
    
    [dateSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    UIDatePicker *dp = [[UIDatePicker alloc]init];
    [dp setDatePickerMode:UIDatePickerModeDate];
    [dp addTarget:self action:@selector(datePickerCallback) forControlEvents:UIControlEventValueChanged];
    _dateTextField.inputView = dp;
    [dateSheet addSubview:dp];

    
    UIDatePicker *tp = [[UIDatePicker alloc]init];
    [tp setDatePickerMode:UIDatePickerModeTime];
    [tp addTarget:self action:@selector(timePickerCallback) forControlEvents:UIControlEventValueChanged];
    _timeTextField.inputView = tp;
    [dateSheet addSubview:tp];

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
    NSArray *listOfView = [dateSheet subviews];
    for (UIView *subview in listOfView)
    {
        if ([subview isKindOfClass:[UIDatePicker class]])
        {
            self.inputDate = [(UIDatePicker *)subview date];
        }
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"dd / MM / YYYY"];
    
    [_dateTextField setText:[dateFormatter stringFromDate:self.inputDate]];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit ;
    
    NSDateComponents *ageCalc = [calendar components:unitFlags
                                            fromDate:self.inputDate
                                              toDate:[NSDate date]
                                             options:0];
    int days = [ageCalc day];
    int mouths = [ageCalc month];
    int years = [ageCalc year];
    
    /*
    if (years < 0 || mouths < 0 || days < 0)
    {
        [self.ageLabel setText:@"Not Born Yet"];
    }
    else if(years == 0 && mouths == 0 && days ==0)
    {
        [self.ageLabel setText:@"Todaay is birthday"];
    }
    else
    {
        NSString *output = [NSString stringWithFormat:@"%i years %i mouths %i days",years,mouths,days];
        [self.ageLabel setText:output];
    }
    */
    
    NSString *output = [NSString stringWithFormat:@"%i years %i mouths %i days",years,mouths,days];
    [self.dateTextField setText:output];
    [dateSheet dismissWithClickedButtonIndex:0 animated:YES];
    
    //NSDateFormatter *formatterDate = [[NSDateFormatter alloc]init];
    //[formatterDate setDateFormat:@"dd  MMMM  yyyy"];
    //_dateTextField.text = [formatterDate stringFromDate:[NSDate date]];
    //_inputDate.text = @"date";
}

- (void)timePickerCallback
{
    NSArray *listOfView = [dateSheet subviews];
    for (UIView *subview in listOfView)
    {
        if ([subview isKindOfClass:[UIDatePicker class]])
        {
            self.inputTime = [(UIDatePicker *)subview date];
        }
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    [_timeTextField setText:[dateFormatter stringFromDate:self.inputTime]];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ;
    
    NSDateComponents *ageCalc = [calendar components:unitFlags
                                            fromDate:self.inputTime
                                              toDate:[NSDate date]
                                             options:0];

    int hours = [ageCalc hour];
    int minutes = [ageCalc minute];
    int second = [ageCalc second];
    
    NSString *output = [NSString stringWithFormat:@"%i hours %i minutes %i second",hours,minutes,second];
    [self.timeTextField setText:output];
    [dateSheet dismissWithClickedButtonIndex:0 animated:YES];

    
    //NSDateFormatter *formatterTime = [[NSDateFormatter alloc]init];
    //[formatterTime setDateFormat:@"HH:mm:ss"];
    //_timeTextField.text = [formatterTime stringFromDate:[NSDate date]];
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
