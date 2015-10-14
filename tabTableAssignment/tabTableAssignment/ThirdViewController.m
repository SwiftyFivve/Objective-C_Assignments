//
//  ThirdViewController.m
//  tabTableAssignment
//
//  Created by Jordan Weaver on 9/8/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "ThirdViewController.h"
#import "customClass.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController
@synthesize userAddress, nameText, streetText, cityText, stateText, zipText, userInfo;

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
    userAddress = [[customClass alloc]init];
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)setAddress:(id)sender
{
    [self.view endEditing:YES];
    userAddress.name = nameText.text;
    userAddress.street = streetText.text;
    userAddress.city = cityText.text;
    userAddress.state = stateText.text;
    userAddress.zip = zipText.text;
    
    userInfo.text = [NSString stringWithFormat: @"%@\n%@\n%@, %@\n%@", userAddress.name, userAddress.street, userAddress.city, userAddress.state, userAddress.zip];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
