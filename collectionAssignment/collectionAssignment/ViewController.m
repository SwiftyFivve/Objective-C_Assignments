//
//  ViewController.m
//  collectionAssignment
//
//  Created by Jordan Weaver on 9/10/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "ViewController.h"
#import "customClass.h"
#import "customCell.h"
#import "customHeader.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize qbImages, qbNames, rbImages, wrImages, wrNames, rbNames, qbArray, rbArray, wrArray, master, collectionFullView, headerTitles;

static int numberOfCells = 5;
static int numberOfSections = 3;

- (void)viewDidLoad
{
    //Quarterback Info
    qbImages = [NSArray arrayWithObjects:@"cassel.jpg", @"colin.jpg", @"flaco.jpg", @"newton.jpg", @"rodgers.jpeg", nil];
    qbNames = [NSArray arrayWithObjects:@"Matt Cassel", @"Colin Kaepernick", @"Joe Flaco", @"Cam Newton", @"Aaron Rodgers", nil];
    
    //Runningback Info
    rbImages = [NSArray arrayWithObjects:@"bush.jpg", @"foster.jpg", @"gore.jpg", @"mccoy.jpg", @"peterson.jpg", nil];
    rbNames = [NSArray arrayWithObjects:@"Reggie Bush", @"Arian Foster", @"Frank Gore", @"LeSean McCoy", @"Adrian Peterson", nil];
    
    //Wide Receiver Info
    wrImages = [NSArray arrayWithObjects:@"brynt.jpg", @"harvin.jpg", @"johnson.jpg", @"jones.jpg", @"marshall.jpg", nil];
    wrNames = [NSArray arrayWithObjects:@"Dez Brynt", @"Percy Harvin", @"Calvin Johnson", @"Julio Jones", @"Brandon Marshall", nil];
    qbArray = [[NSMutableArray alloc]initWithCapacity:5];
    rbArray = [[NSMutableArray alloc]initWithCapacity:5];
    wrArray = [[NSMutableArray alloc]initWithCapacity:5];
    
    headerTitles = [[NSMutableArray alloc]initWithObjects:@"Quarterbacks", @"Runningbacks", @"Wide Receivers", nil];
    
    for (int i = 0; i< [qbImages count]; i++) {
        customClass* qbSection = [[customClass alloc]initWithImage:[UIImage imageNamed:qbImages[i]] string:qbNames[i]];
        [qbArray addObject:qbSection];
        customClass* rbSection = [[customClass alloc]initWithImage:[UIImage imageNamed:rbImages[i]] string:rbNames[i]];
        [rbArray addObject:rbSection];
        customClass* wrSection = [[customClass alloc]initWithImage:[UIImage imageNamed:wrImages[i]] string:wrNames[i]];
        [wrArray addObject:wrSection];
    }
    master = [NSMutableArray arrayWithObjects:qbArray, rbArray, wrArray, nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView* backgroundView = [[UIView alloc]init];
    backgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wallpaper.jpg"]];
    collectionFullView.backgroundView = backgroundView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    customCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    customClass* someName = ((customClass*)master[indexPath.section][indexPath.row]);
    
            cell.nameLabel.text = someName.cellText;
            cell.playerImg.image = someName.cellImage;
            
    
    
    return cell;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return numberOfCells;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return numberOfSections;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NSString* reuse = @"header";
    
    //button tage = section
    
    customHeader* header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:reuse forIndexPath:indexPath];
    
    header.positionLabel.text = headerTitles[indexPath.section];
    
    header.delButton.tag = indexPath.section;
    
    return header;
}

-(IBAction)deleteSection:(id)sender
{
    int tagNum = ((UIButton*)sender).tag;
    
    [master removeObjectAtIndex:tagNum];
    [headerTitles removeObjectAtIndex:tagNum];
    NSLog(@"%i", tagNum);
    numberOfSections --;
    [collectionFullView deleteSections:[[NSIndexSet alloc]initWithIndex:0]];
}

@end
