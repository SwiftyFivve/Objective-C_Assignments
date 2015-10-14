//
//  ViewController.h
//  eventAssignment
//
//  Created by Jordan Weaver on 9/19/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKitUI/EventKitUI.h>

@interface ViewController : UIViewController<UITextFieldDelegate, EKEventEditViewDelegate, EKCalendarChooserDelegate, UIAlertViewDelegate>
{
    IBOutlet UIButton* addCalButton;
    IBOutlet UIButton* addEventButton;
    IBOutlet UILabel* calName;
    IBOutlet UITextView* eventList;
    IBOutlet UITextField* userName;
    EKCalendar* newCalendar;
    NSMutableArray* identifiers;
    EKCalendarChooser* chooser;
    EKCalendar* selected;
}

@end
