//
//  ViewController.h
//  mapAssignment
//
//  Created by Jordan Weaver on 9/17/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>
{
    MKPointAnnotation *lazyMoon;
    MKPointAnnotation *bDubs;
    MKPointAnnotation *regal;
    MKPointAnnotation *ucf;
    MKPointAnnotation *publix;
}

-(IBAction)segmentChanged:(id)sender;
-(IBAction)currentLocation:(id)sender;

@property BOOL currentLoc;
@property BOOL showAnn;
@property NSArray* annArray;


@property IBOutlet UISegmentedControl* mapType;
@property IBOutlet MKMapView* mainMap;



@end
