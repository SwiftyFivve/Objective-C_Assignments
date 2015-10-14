//
//  SecondViewController.m
//  tabTableAssignment
//
//  Created by Jordan Weaver on 9/8/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize picker, pickerLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)pickerButton:(id)sender
{
    if (picker.hidden == true)
        picker.hidden = false;
    else
        picker.hidden = true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString* returnString = [NSString stringWithFormat:@"%i", row];
    
    return returnString;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    pickerLabel.text = [NSString stringWithFormat: @"You picked %i", row];
}

@end
