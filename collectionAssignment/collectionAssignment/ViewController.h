//
//  ViewController.h
//  collectionAssignment
//
//  Created by Jordan Weaver on 9/10/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>
@class customClass;

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property NSArray* qbImages;
@property NSArray* qbNames;
@property NSArray* rbImages;
@property NSArray* rbNames;
@property NSArray* wrImages;
@property NSArray* wrNames;

@property NSMutableArray* headerTitles;
@property NSMutableArray* qbArray;
@property NSMutableArray* rbArray;
@property NSMutableArray* wrArray;
@property NSMutableArray* master;


@property IBOutlet UICollectionView* collectionFullView;

@end
