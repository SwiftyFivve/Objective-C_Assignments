//
//  SecondViewController.h
//  webAssignment
//
//  Created by Jordan Weaver on 9/22/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ThirdViewController;

@interface SecondViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property IBOutlet UITableView* myTableView;

@property IBOutlet UIWebView* dummyWebView;

@property NSMutableData* apiData;

@property NSMutableArray* titles;
@property NSMutableArray* authors;
@property NSMutableArray* urls;

@property NSMutableString* sendURL;

@property ThirdViewController* sourceWebView;

-(IBAction)exit:(id)sender;

@end
