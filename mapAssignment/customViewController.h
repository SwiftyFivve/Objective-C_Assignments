//
//  customViewController.h
//  mapAssignment
//
//  Created by Jordan Weaver on 9/17/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "ViewController.h"

@interface customViewController : ViewController
{
    ViewController* vc;
}
@property IBOutlet UISwitch* annSwitch;
@property IBOutlet UILabel* locationLabel;

-(IBAction)showAnnotations:(id)sender;

@end
