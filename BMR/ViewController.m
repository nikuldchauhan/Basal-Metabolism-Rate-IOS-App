//
//  ViewController.m
//  BMR //
//  Created by NIKUL CHAUHAN on 2/14/16.
//  Copyright © 2016 NIKUL CHAUHAN. All rights reserved.
//  Email ID: nikulchauhan@csu.fulerton.edu
//  Contact No: 714-213-5652
/*
        Description: It is a contoller.
    In this file there is implementation of 2 methods.
    (1) When switch state changes it changes the label for units for example
      KG -> Pound
    (2) When tap on calculate button it converts the unit into metric system 
      if unit is set Us Customery. It also check if it is male or female and according to
        that it set the Psex ivar to 0 or 1. Male -> 1 and Female ->0. It fetches the sigleton instance of PersonBMR model and call the methods for calculating BMR and Calculating calories if person need to loose 5 pound how much calories he/she need daily and set labels accordingly.
    It also do validation on textfield.
*/

#import "ViewController.h"
#import "PersonBMR.h"

@interface ViewController ()
{
    
}
@end

@implementation ViewController

NSNumber *Height;
NSNumber *Weight;
NSNumber *Age;
NSString *SexSelected;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.HeightText resignFirstResponder];
    [self.WeightText resignFirstResponder];
    [self.AgeText resignFirstResponder];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [sex count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [sex objectAtIndex:row];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    sex = [[NSArray alloc] initWithObjects: @"Male", @"Female", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)UnitSwitch:(id)sender {
    
    NSString *UnitValue = self.UnitLabel.text;
    
    if([UnitValue isEqualToString:@"US"])
    {
        self.UnitLabel.text = @"Metric";
        self.HeightLabel.text = @"CM";
        self.WeightLabel.text = @"KG";
    }
    else
    {
        self.UnitLabel.text = @"US";
        self.HeightLabel.text = @"Inch";
        self.WeightLabel.text = @"Pound";
    }
    
}

- (IBAction)CalculateButton:(id)sender {
    self.HeightText.layer.borderColor=[[UIColor blackColor]CGColor];
    self.HeightText.layer.borderWidth=1.0;
    
    self.WeightText.layer.borderColor=[[UIColor blackColor]CGColor];
    self.WeightText.layer.borderWidth=1.0;
    
    self.AgeText.layer.borderColor=[[UIColor blackColor]CGColor];
    self.AgeText.layer.borderWidth=1.0;
    
    BOOL b = FALSE;
    
    if ([self.HeightText.text length] == 0 || self.HeightText.text == nil || ![self.HeightText.text isEqual:@""] == FALSE)
    {
        b = TRUE;
        self.HeightText.layer.borderColor=[[UIColor redColor]CGColor];
        self.HeightText.layer.borderWidth=3.0;
    }
    
    if ([self.WeightText.text length] == 0 || self.WeightText.text == nil || ![self.WeightText.text isEqual:@""] == FALSE)
    {
        b = TRUE;
        self.WeightText.layer.borderColor=[[UIColor redColor]CGColor];
        self.WeightText.layer.borderWidth=3.0;
    }
    
    if ([self.AgeText.text length] == 0 || self.AgeText.text == nil || ![self.AgeText.text isEqual:@""] == FALSE)
    {
        b = TRUE;
        self.AgeText.layer.borderColor=[[UIColor redColor]CGColor];
        self.AgeText.layer.borderWidth=3.0;
    }
    
    if(!b)
    {
    Height = [NSNumber numberWithDouble: [self.HeightText.text doubleValue]];
    Weight = [NSNumber numberWithDouble: [self.WeightText.text doubleValue]];
    Age = [NSNumber numberWithDouble: [self.AgeText.text doubleValue]];
    NSInteger row;
    row = [self.SexPicker selectedRowInComponent:0];
    SexSelected = [sex objectAtIndex:row];
   
    if ([self.UnitLabel.text isEqualToString:@"US"])
    {
        Height = @([Height doubleValue] * 2.54);
        Weight = @([Weight doubleValue] * 0.453592);
    }
    PersonBMR *singletonInstance = [PersonBMR getSharedSingletonInstance];
    singletonInstance.PHeight = Height;
    singletonInstance.PWeight = Weight;
    singletonInstance.PAge = Age;
    if([SexSelected isEqualToString:@"Male"])
    {
        singletonInstance.PSex = [NSNumber numberWithInt:1];
    }
    else
    {
        singletonInstance.PSex = [NSNumber numberWithInt:0];
    }
    NSNumber *Result = [singletonInstance CalculateBMR];
    NSArray *myStrings = [[NSArray alloc] initWithObjects:@"Your BMR is ", Result, @" calories", nil];
    self.ResultLabel.text = [myStrings componentsJoinedByString:@""];
    NSNumber *DietResult = [singletonInstance CalculateDietResult:Result];
        NSArray *myDietString = [[NSArray alloc] initWithObjects:@" If you take ", DietResult, @" calories then you will loose 5 pound weight in 3 months", nil];
        self.DietResultLabel.text = [myDietString componentsJoinedByString:@""];
    }
}

@end
