//
//  ViewController.h
//  tableViewAssignment_weaverJordan
//
//  Created by Jordan Weaver on 9/3/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{

}
@property  NSArray* artistArry;

@property (weak, nonatomic) IBOutlet UITableView *VCTableView;

@end
