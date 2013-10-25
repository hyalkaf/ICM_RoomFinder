//
//  ICM_Node.h
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-18.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMaps/GoogleMaps.h>

@interface ICM_Node : NSObject

@property (nonatomic, getter = isInside) BOOL inside;
@property (nonatomic, getter = isGroundLevel) BOOL groundLevel;
@property (nonatomic, getter = isRoom) BOOL roomNode;
@property (nonatomic) CLLocationCoordinate2D location;
@property (strong, nonatomic) UIImage *photo;

- (id)initWithValues:(BOOL)inside Ground:(BOOL)ground Lattitude:(float)lattitude Longitude:(float)longitude Photo:(UIImage*)photo;

@end
