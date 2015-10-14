//
//  FirstViewController.m
//  tabTableAssignment
//
//  Created by Jordan Weaver on 9/8/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier = @"cells";
    UITableViewCell* newCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (newCell == nil)
    {
        newCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    newCell.textLabel.text = [NSString stringWithFormat: @"Row %i", indexPath.row];
    
    return newCell;
}


@end
