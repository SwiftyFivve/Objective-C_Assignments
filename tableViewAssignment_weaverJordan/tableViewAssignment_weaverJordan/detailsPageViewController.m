//
//  detailsPageViewController.m
//  tableViewAssignment_weaverJordan
//
//  Created by Jordan Weaver on 9/3/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "detailsPageViewController.h"
#import "artistInfo.h"


@interface detailsPageViewController ()

@end

@implementation detailsPageViewController
@synthesize artistName, releaseDate, albumArt, trackList, artistDets;

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
    artistName.text = artistDets.name;
    releaseDate.text = artistDets.releaseDate;
    albumArt.image = artistDets.albumArt;
    trackList.text = artistDets.trackList;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
