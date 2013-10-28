//
//  ICM_RouteMapViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-27.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_RouteMapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "ICM_Model.h"

@interface ICM_RouteMapViewController ()

@end

@implementation ICM_RouteMapViewController
{
    GMSMapView *mapView_;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    NSArray *results = [[NSArray alloc] initWithArray:([sharedModel shortestPath])];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[[sharedModel startNode] nodeLocation].latitude
                                                            longitude:[[sharedModel startNode] nodeLocation].longitude
                                                                 zoom:18];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];

    GMSMutablePath *path = [GMSMutablePath path];
    for (int i = 0; i < [results count]; i++)
    {
        [path addCoordinate:[[results objectAtIndex:i] nodeLocation]];
    }
    // 51.078134,-114.127758 = node 3 closest
    //    CLLocation *locA = [[CLLocation alloc] initWithLatitude:51.078134 longitude:-114.127758];
    //    // 51.077789,-114.127436 = node 2 closest
//    [path addLatitude:51.078134 longitude:-114.127758];
//    [path addLatitude:51.077789 longitude:-114.127436];
    GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
    polyline.strokeWidth = 10;
    polyline.map = mapView_;
    
    GMSMarker *marker1 = [[GMSMarker alloc] init];
    marker1 = [GMSMarker markerWithPosition:[[sharedModel startNode] nodeLocation]];
    marker1.title = @"Start";
    marker1.map = mapView_;

    GMSMarker *marker2 = [[GMSMarker alloc] init];
    marker2 = [GMSMarker markerWithPosition:[[sharedModel endNode] nodeLocation]];
    marker2.title = @"Finish";
    marker2.map = mapView_;
    

    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithTitle:@"Begin Slideshow" style:self.editButtonItem target:self action:@selector(beginButtonPressed:)];
    self.navigationItem.rightBarButtonItem = button1;
	// Do any additional setup after loading the view.
}

- (void)beginButtonPressed:(id)sender
{
    [self performSegueWithIdentifier: @"mySegue" sender: self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
