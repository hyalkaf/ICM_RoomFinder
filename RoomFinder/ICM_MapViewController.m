//
//  ICM_MapViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ICM_MapViewController ()

@end

@implementation ICM_MapViewController
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
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
//    NE = 51.087755,-114.116585 SW = 51.074221,-114.144523
//    CLLocationCoordinate2D NE = CLLocationCoordinate2DMake(51.087755, -114.116585);
//    CLLocationCoordinate2D SW = CLLocationCoordinate2DMake(51.074221, -114.144523);
//    GMSCoordinateBounds *bounds = [[GMSCoordinateBounds alloc] initWithCoordinate:NE coordinate:SW];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:51.078198
                                                            longitude:-114.130001
                                                                 zoom:17];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;



}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
