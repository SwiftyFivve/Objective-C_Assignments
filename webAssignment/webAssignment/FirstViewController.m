//
//  FirstViewController.m
//  webAssignment
//
//  Created by Jordan Weaver on 9/22/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize myWebView, myData;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL* url = [NSURL URLWithString:@"http://www.nfl.com"];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [myWebView loadRequest:request];
    
    myData = [[NSMutableData alloc]init];
    NSURLConnection* connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [connection start];
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

@end
