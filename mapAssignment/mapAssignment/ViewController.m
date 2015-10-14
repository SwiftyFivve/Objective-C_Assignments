//
//  ViewController.m
//  mapAssignment
//
//  Created by Jordan Weaver on 9/17/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "ViewController.h"
#import "customViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapType, mainMap, showAnn, annArray, currentLoc;

- (void)viewDidLoad
{
    //allocate all drop pins here
    lazyMoon = [[MKPointAnnotation alloc]init];
    lazyMoon.coordinate = CLLocationCoordinate2DMake(28.5977621, -81.2195145);
    lazyMoon.title = @"Lazy Moon";
    lazyMoon.subtitle = @"Home of giant Pizza";
    
    bDubs = [[MKPointAnnotation alloc]init];
    bDubs.coordinate = CLLocationCoordinate2DMake(28.550728, -81.379478);
    bDubs.title = @"Firestone Live";
    bDubs.subtitle = @"Land of the concerts";
    
    regal = [[MKPointAnnotation alloc]init];
    regal.coordinate = CLLocationCoordinate2DMake(28.5543244, -81.2060572);
    regal.title = @"Regal Waterford Lakes Stadium";
    regal.subtitle = @"Home of IMAX";
    
    ucf = [[MKPointAnnotation alloc]init];
    ucf.coordinate = CLLocationCoordinate2DMake(28.59716, -81.203721);
    ucf.title = @"UCF";
    ucf.subtitle = @"Land of the Knights";
    
    publix = [[MKPointAnnotation alloc]init];
    publix.coordinate = CLLocationCoordinate2DMake(28.5989571, -81.2883224);
    publix.title = @"Publix";
    publix.subtitle = @"Home of the BOGOs";
    
    //set in an array
    annArray = [NSArray arrayWithObjects:lazyMoon, bDubs, regal, ucf, publix, nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered
{
    if (fullyRendered)
    {
        CLLocationCoordinate2D mapCoordinate = CLLocationCoordinate2DMake(28.53686, -81.379564);
        
        MKCoordinateSpan mapSpan = MKCoordinateSpanMake(1, 1);
        
        MKCoordinateRegion mapRegion = MKCoordinateRegionMake(mapCoordinate, mapSpan);
        
        [mapView setRegion:mapRegion animated:YES];

    }
}

//toggle map type here vie segment control
-(IBAction)segmentChanged:(id)sender
{

    switch (((UISegmentedControl*) sender).selectedSegmentIndex)
    {
        case 0:
            mainMap.mapType = MKMapTypeStandard;
            break;
        case 1:
            mainMap.mapType = MKMapTypeSatellite;
            break;
        case 2:
            mainMap.mapType = MKMapTypeHybrid;
            break;
    }
}

//toggle current location here
-(IBAction)currentLocation:(id)sender
{
    if (mainMap.showsUserLocation == NO)
    {
        mainMap.showsUserLocation = YES;
        currentLoc = YES;
    }
    else if (mainMap.showsUserLocation == YES)
    {
        mainMap.showsUserLocation = NO;
        currentLoc = NO;
    }
    
}

//add/remove annotations here based off boolean value
-(void)viewWillAppear:(BOOL)animated
{
    if (showAnn == TRUE)
    {
        //loop through array
        for (int i = 0; i<[annArray count]; i++)
        {
            [mainMap addAnnotation:annArray[i]];
        }
        NSLog(@"TRUE");
    }
    else
    {
        NSLog(@"FALSE");
        //loop through array
        for (int i = 0; i<[annArray count]; i++)
        {
        [mainMap removeAnnotation:annArray[i]];
        }
    }
}

//allocate and annomate drop pins here
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString* reuse = @"reuse";
    MKPinAnnotationView* pins = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:reuse];
    
    if ([annotation isEqual: mainMap.userLocation]) {
        return nil;
    }
    
    if (pins == nil) {
        //loop through array
        for (int i = 0; i<[annArray count]; i++) {
        pins = [[MKPinAnnotationView alloc]initWithAnnotation:annArray[i] reuseIdentifier:reuse];
        }
    }
    
    pins.animatesDrop = YES;
    pins.canShowCallout = YES;
    
    return pins;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
