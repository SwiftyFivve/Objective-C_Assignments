//
//  ViewController.m
//  eventAssignment
//
//  Created by Jordan Weaver on 9/19/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "ViewController.h"
#import <EventKit/EventKit.h>

@interface ViewController ()

@property EKEventStore* eventStore;
@property NSString* calendarIdentifier;

@end

@implementation ViewController
@synthesize eventStore, calendarIdentifier;

- (void)viewDidLoad
{
    //setting delegates/allocating
    eventStore = [[EKEventStore alloc]init];
    userName.delegate = self;
    identifiers = [[NSMutableArray alloc]init];
    
    [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * error){}];
    
    chooser = [[EKCalendarChooser alloc]initWithSelectionStyle:EKCalendarChooserSelectionStyleSingle displayStyle:EKCalendarChooserDisplayWritableCalendarsOnly entityType:EKEntityTypeEvent eventStore:eventStore];
    
    chooser.delegate = self;
    //important
    chooser.showsDoneButton = YES;
    chooser.showsCancelButton = YES;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//add calendar button
-(IBAction)addCal:(id)sender
{
    calName.hidden = TRUE;
    userName.hidden = FALSE;
    [userName becomeFirstResponder];
}

//return button on keyboard
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [userName resignFirstResponder];
    
    return YES;
}

//after keyboard closes
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString* alertCal = [NSString stringWithFormat:@"Would you really like to add '%@' to your Calendars?", userName.text];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Add Calender" message:alertCal delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alert addButtonWithTitle:@"Add"];
    [alert show];
    alert.tag = 0;
    NSLog(@"%@", userName.text);
}

//all alert views and events inside each one
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 0) {
        if (buttonIndex == 1)
        {
            newCalendar = [EKCalendar calendarForEntityType:EKEntityTypeEvent eventStore:eventStore];
            
            newCalendar.source = [[eventStore sources]objectAtIndex:0];
            newCalendar.title = userName.text;
            newCalendar.CGColor = [UIColor redColor].CGColor;
            
            calendarIdentifier = newCalendar.calendarIdentifier;
            
            NSError* error1 = nil;
            [eventStore saveCalendar:newCalendar commit:YES error:&error1];
            NSLog(@"%@", error1);
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success!" message:@"Calendar was successfully added" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles:nil, nil];
            [alert show];
            
            addCalButton.enabled = NO;
            calName.text = userName.text;
            userName.hidden = TRUE;
            calName.hidden = FALSE;
            
        }
        else
        {
            
        }
    }
    else if (alertView.tag == 1)
    {
        if (buttonIndex == 1) {
            [eventStore removeCalendar:newCalendar commit:YES error:nil];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success!" message:@"Calendar was successfully deleted" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles:nil, nil];
            [alert show];
            calName.text = @"Add Calendar:";
            addCalButton.enabled = YES;
        }
    }
    else if (alertView.tag == 2)
    {
        if (buttonIndex == 1)
        {
    
            NSError* error2 = nil;
            for (int i = 0; i< [identifiers count]; i++)
            {
                EKEvent* idEK = [eventStore eventWithIdentifier:identifiers[i]];
                [eventStore removeEvent:idEK span:EKSpanThisEvent commit:YES error:&error2];
            }
            NSLog(@"%@", error2);
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success!" message:@"Events were successfully deleted" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles:nil, nil];
            [alert show];
            [identifiers removeAllObjects];
            eventList.text = nil;
        }
    }
    
}

//remove the user added calendar
-(IBAction)removeCal:(id)sender
{
    NSString* alertCal = [NSString stringWithFormat:@"Would you really like to delete '%@' from your Calendars?", userName.text];
    UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Delete Calender" message:alertCal delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alert2 addButtonWithTitle:@"Delete"];
    alert2.tag = 1;
    [alert2 show];
}


//add a new event button
-(IBAction)addEvent:(id)sender
{
    EKEventEditViewController* eventView = [[EKEventEditViewController alloc]init];

    eventView.eventStore = eventStore;
    eventView.editViewDelegate = self;
   
    [self presentViewController:eventView animated:YES completion:nil];
}


//did complete adding the event
-(void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action
{
    [controller dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@", controller.event.title);
    //eventIdentifier
    [identifiers addObject:[NSString stringWithFormat:@"%@", controller.event.eventIdentifier]];
    
    if (controller.event.title != nil)
    {
        eventList.text = [eventList.text stringByAppendingString:[NSString stringWithFormat:@"\n%@", controller.event.title]];
    }
}


//choose calendar button
-(IBAction)chooseCal:(id)sender
{
    [self.navigationController pushViewController:chooser animated:YES];
    
}

-(void)calendarChooserDidCancel:(EKCalendarChooser *)calendarChooser
{
    [calendarChooser.navigationController popViewControllerAnimated:YES];
}

//after calendar closes event
-(void)calendarChooserDidFinish:(EKCalendarChooser *)calendarChooser
{
    NSSet* calendars = [calendarChooser selectedCalendars];
    
    selected = [[calendars allObjects] objectAtIndex:0];
    NSLog(@"%@", selected);
    
    if (selected.title != nil) {
        [addEventButton setTitle:[NSString stringWithFormat:@"Add Event to '%@'", selected.title] forState:normal];
    }
    
    [calendarChooser.navigationController popViewControllerAnimated:YES];
}

//modifies selected calendar in the add event view
-(EKCalendar *)eventEditViewControllerDefaultCalendarForNewEvents:(EKEventEditViewController *)controller
{
    return selected;
}

//remove events button, removes all events
-(IBAction)removeEvents:(id)sender
{
    UIAlertView *alert3 = [[UIAlertView alloc] initWithTitle:@"Delete Events" message:@"Would you really like to delete all your saved events" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alert3 addButtonWithTitle:@"Delete"];
    alert3.tag = 2;
    [alert3 show];
    
}

@end
