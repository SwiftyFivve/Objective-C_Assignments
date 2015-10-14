//
//  ViewController.m
//  searchAssignment
//
//  Created by Jordan Weaver on 9/12/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "ViewController.h"
#import "customTableView.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize savedSearch, savedPlayers;

- (void)viewDidLoad
{
    savedPlayers = [[NSMutableArray alloc]initWithCapacity:5];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    savedSearch.text = [savedPlayers componentsJoinedByString:@"\n"];
    //savedSearch.text = [NSString stringWithFormat: @"%@", savedPlayers];
    NSLog(@"%@", savedPlayers);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clear:(id)sender
{
    savedSearch.text = nil;
    
    [self savedSearch];
}

@end
