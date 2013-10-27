//
//  ICM_SelectionTypeViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-26.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_SelectionTypeViewController.h"
#import "ICM_Model.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ICM_SelectionTypeViewController ()

@end

@implementation ICM_SelectionTypeViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getGPSLocation:(id)sender
{
    GMSMapView *mapView;
    mapView.myLocationEnabled = YES;
    CLLocation *myLocation = mapView.myLocation;
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    
    // uncomment this for actual GPS info
    //CLLocation *locA = [[CLLocation alloc] initWithLatitude:myLocation.coordinate.latitude longitude:myLocation.coordinate.longitude];
    
    // dummy info
    // 51.078134,-114.127758 = node 3 closest
//    CLLocation *locA = [[CLLocation alloc] initWithLatitude:51.078134 longitude:-114.127758];
//    // 51.077789,-114.127436 = node 2 closest
//    CLLocation *locA = [[CLLocation alloc] initWithLatitude:51.077789 longitude:-114.127436];
//    // 51.077711,-114.127978 = node 1 closest
//    CLLocation *locA = [[CLLocation alloc] initWithLatitude:51.077711 longitude:-114.127978];
//    // 51.077891,-114.128463 = node 0 closest
    CLLocation *locA = [[CLLocation alloc] initWithLatitude:51.077891 longitude:-114.128463];
    
    int closestNodeIndex = -1;
    CLLocationDistance shortestDistance = 999999;
    for (int x = 0; x < [[sharedModel nodeList] count]; x++)
    {
        CLLocation *locB = [[CLLocation alloc] initWithLatitude:[[[sharedModel nodeList] objectAtIndex:x] nodeLocation].latitude longitude:[[[sharedModel nodeList] objectAtIndex:x] nodeLocation].longitude];

        
        CLLocationDistance currentDistance = [locA distanceFromLocation:locB];
        if (currentDistance < shortestDistance)
        {
            shortestDistance = currentDistance;
            closestNodeIndex = x;
        }
        //Distance in Meters
    }
    // NSLog(@"Closest Node Name = %@", [[[sharedModel nodeList] objectAtIndex:closestNodeIndex] name]);
    
    [sharedModel setStartNode:[[sharedModel nodeList] objectAtIndex:closestNodeIndex]];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
