//
//  detailsPageViewController.h
//  tableViewAssignment_weaverJordan
//
//  Created by Jordan Weaver on 9/3/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>

@class artistInfo;

@interface detailsPageViewController : UIViewController

@property IBOutlet UILabel* artistName;
@property IBOutlet UILabel* releaseDate;
@property IBOutlet UIImageView* albumArt;
@property IBOutlet UITextView* trackList;

@property artistInfo* artistDets;



@end
