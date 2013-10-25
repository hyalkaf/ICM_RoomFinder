//
//  ICM_Node.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-18.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_Node.h"
#import <GoogleMaps/GoogleMaps.h>

@implementation ICM_Node

//-(id)init
//{
//    if (self = [super init])
//    {
//        return [self initWithValues:<#(BOOL)#> Ground:<#(BOOL)#> Lattitude:<#(float)#> Longitude:<#(float)#> Photo:<#(UIImage *)#>]
//    }
//    return self;
//}

- (id)initWithValues:(BOOL)inside Ground:(BOOL)ground Lattitude:(float)lattitude Longitude:(float)longitude Photo:(UIImage*)photo;
{
    if (self = [super init])
    {
        _inside = inside;
        _groundLevel = ground;
        _location = CLLocationCoordinate2DMake(lattitude, longitude);
        _photo = photo;
    }
    return self;
}

@end
