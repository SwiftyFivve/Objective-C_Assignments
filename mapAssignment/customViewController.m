//
//  customViewController.m
//  mapAssignment
//
//  Created by Jordan Weaver on 9/17/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "customViewController.h"

@interface customViewController ()

@end

@implementation customViewController
@synthesize annSwitch, locationLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    vc = self.navigationController.viewControllers[0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)viewWillAppear:(BOOL)animated
{
    //toggles current location label
    if (vc.currentLoc == FALSE)
    {
        locationLabel.text = @"Current user location is off";
    }
    else if (vc.currentLoc == TRUE)
    {
        locationLabel.text = @"Current user location is on";
    }
    
    //toggles switch to stay the way the user set it
    if (vc.showAnn == FALSE)
    {
        [annSwitch setOn:NO];
    }
    else if (vc.showAnn == TRUE)
    {
        [annSwitch setOn:YES];
    }
}

-(IBAction)showAnnotations:(id)sender
{
    if ([sender isOn] == YES)
    {
        vc.showAnn = TRUE;
        NSLog(@"Changed to true");
    }
    else if ([sender isOn] == FALSE)
    {
        vc.showAnn = FALSE;
        NSLog(@"changed to false");
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
