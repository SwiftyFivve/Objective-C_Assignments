//
//  ViewController.h
//  searchAssignment
//
//  Created by Jordan Weaver on 9/12/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property IBOutlet UITextView* savedSearch;

@property NSMutableArray* savedPlayers;

-(IBAction)clear:(id)sender;

@end
