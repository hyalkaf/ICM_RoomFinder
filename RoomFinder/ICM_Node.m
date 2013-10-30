//
//  ICM_Node.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-18.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_Node.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>
#import "ICM_Node.h"
#import <MapKit/MapKit.h>

@implementation ICM_Node

// custom initializer
//
// if default properties are changed, make sure to update this function
- (id)initWithValues:(BOOL)inside Ground:(BOOL)ground Lattitude:(float)lattitude Longitude:(float)longitude Photo:(UIImage*)photo Name:(NSString*)name;
{
    if (self = [super init])
    {
        _inside = inside;
        _groundLevel = ground;
        _nodeLocation = CLLocationCoordinate2DMake(lattitude, longitude);
        _photo = photo;
        _neighboursAndWeights = [[NSMutableArray alloc] init];
        _name = name;
    }
    return self;
}


// adds a neighbour to a node
- (void)addNeighbour:(ICM_Node*)node
{
//    CLLocation *locB = [[CLLocation alloc] initWithLatitude:[[[sharedModel nodeList] objectAtIndex:x] nodeLocation].latitude longitude:[[[sharedModel nodeList] objectAtIndex:x] nodeLocation].longitude];
//    
//    
//    CLLocationDistance currentDistance = [locA distanceFromLocation:locB];
    //CLLocationDistance currentDistance = [locA distanceFromLocation:locB];
    CLLocation *locA = [[CLLocation alloc] initWithLatitude:_nodeLocation.latitude longitude:_nodeLocation.longitude];
    CLLocation *locB = [[CLLocation alloc] initWithLatitude:node.nodeLocation.latitude longitude:node.nodeLocation.longitude];
    CLLocationDistance distance1 = [locA distanceFromLocation:locB];
    NSNumber *distance2 = [NSNumber numberWithDouble:distance1];
    [_neighboursAndWeights addObject:[[NSMutableArray alloc] init]];
    [[_neighboursAndWeights objectAtIndex:([_neighboursAndWeights count]-1)] addObject:node];
    [[_neighboursAndWeights objectAtIndex:([_neighboursAndWeights count]-1)] addObject:distance2];
}

@end

