//
//  FirstViewController.h
//  webAssignment
//
//  Created by Jordan Weaver on 9/22/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UIWebViewDelegate>

@property IBOutlet UIWebView* myWebView;
@property NSMutableData* myData;

@end
