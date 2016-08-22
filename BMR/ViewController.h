//
//  ViewController.h
//  BMR
//
//  Created by NIKUL CHAUHAN on 2/14/16.
//  Copyright © 2016 NIKUL CHAUHAN. All rights reserved.
//  Email ID: nikulchauhan@csu.fulerton.edu
//  Contact No: 714-213-5652
/*
        Description: In this file there are different properties declare like 
        TextField for Height, Weight, Age; PickerView for Sex.
        There is 2 action methods 
        (1) For switch, which swithes the unit
        (2) For button "Calculate", which calculate the BMR
 */

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *sex;
}

@property (weak, nonatomic) IBOutlet UITextField *AgeText;

@property (weak, nonatomic) IBOutlet UITextField *WeightText;

@property (weak, nonatomic) IBOutlet UITextField *HeightText;

@property (weak, nonatomic) IBOutlet UIPickerView *SexPicker;

@property (weak, nonatomic) IBOutlet UILabel *UnitLabel;

@property (weak, nonatomic) IBOutlet UILabel *HeightLabel;

@property (weak, nonatomic) IBOutlet UILabel *WeightLabel;

@property (weak, nonatomic) IBOutlet UILabel *ResultLabel;

@property (weak, nonatomic) IBOutlet UILabel *DietResultLabel;


- (IBAction)UnitSwitch:(id)sender;

- (IBAction)CalculateButton:(id)sender;

@end

