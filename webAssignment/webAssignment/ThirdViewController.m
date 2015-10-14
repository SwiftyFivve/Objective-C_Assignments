//
//  ThirdViewController.m
//  webAssignment
//
//  Created by Jordan Weaver on 9/22/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController
@synthesize webView, mySecondWebView, myData;

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
    
    NSURL* url = [NSURL URLWithString:webView];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [mySecondWebView loadRequest:request];
    
    myData = [[NSMutableData alloc]init];
    NSURLConnection* connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [connection start];

    
    NSLog(@"%@", webView);
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (data != nil)
    {
        [myData appendData:data];
    }
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
