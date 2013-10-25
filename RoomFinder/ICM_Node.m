//
//  ICM_Node.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-18.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_Node.h"
#import <GoogleMaps/GoogleMaps.h>

#import "ICM_Node.h"


@implementation ICM_Node


- (id)initWithValues:(BOOL)inside Ground:(BOOL)ground Lattitude:(float)lattitude Longitude:(float)longitude Photo:(UIImage*)photo Name:(NSString*)name;
{
    if (self = [super init])
    {
        _inside = inside;
        _groundLevel = ground;
        //_location = CLLocationCoordinate2DMake(lattitude, longitude);
        _photo = photo;
        _neighboursAndWeights = [[NSMutableArray alloc] init];
        _name = name;
    }
    return self;
}

- (void)addNeighbour:(ICM_Node*)node Distance:(NSNumber*)distance;
{
    [_neighboursAndWeights addObject:[[NSMutableArray alloc] init]];
    [[_neighboursAndWeights objectAtIndex:([_neighboursAndWeights count]-1)] addObject:node];
    [[_neighboursAndWeights objectAtIndex:([_neighboursAndWeights count]-1)] addObject:distance];
}

@end

