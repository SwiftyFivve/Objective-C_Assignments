//
//  SecondViewController.h
//  tabTableAssignment
//
//  Created by Jordan Weaver on 9/8/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property IBOutlet UILabel* pickerLabel;
-(IBAction)pickerButton:(id)sender;
@property IBOutlet UIPickerView* picker;

@end
