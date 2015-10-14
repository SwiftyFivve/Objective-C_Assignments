//
//  ViewController.h
//  customTableAssignment
//
//  Created by Jordan Weaver on 9/5/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>
{
    UIImage* boring;
    UIImage* kiss;
}

@property IBOutlet UITableView* myTableView;

@property NSArray* mustDos;
@property NSArray* toDos;
@property UIActionSheet* actionSheet;
@property int buttonNum;
@property int tagNum;

@end
