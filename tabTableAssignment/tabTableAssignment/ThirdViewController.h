//
//  ThirdViewController.h
//  tabTableAssignment
//
//  Created by Jordan Weaver on 9/8/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>

@class customClass;

@interface ThirdViewController : UIViewController

@property IBOutlet UITextField* nameText;
@property IBOutlet UITextField* streetText;
@property IBOutlet UITextField* cityText;
@property IBOutlet UITextField* stateText;
@property IBOutlet UITextField* zipText;
@property customClass* userAddress;
@property IBOutlet UITextView* userInfo;

-(IBAction)setAddress:(id)sender;


@end
