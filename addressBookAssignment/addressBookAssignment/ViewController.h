//
//  ViewController.h
//  addressBookAssignment
//
//  Created by Jordan Weaver on 9/24/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MessageUI/MessageUI.h>

@class customObject;

@interface ViewController : UIViewController<ABPeoplePickerNavigationControllerDelegate, ABNewPersonViewControllerDelegate, MFMailComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

-(IBAction)showPeoplePicker:(id)sender;

-(IBAction)showNewPerson:(id)sender;

@property NSString* mainEmail;

@property IBOutlet UITableView* myTableView;

@property NSString* time;

@property NSMutableArray* mainInfo;

@property customObject* objectInfo;

@end
