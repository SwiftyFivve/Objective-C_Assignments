//
//  customTableView.h
//  searchAssignment
//
//  Created by Jordan Weaver on 9/12/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;

@interface customTableView : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>
{
    NSMutableArray *tableData;
    NSMutableArray *searchResults;
}

@end
