//
//  ICM_Node.h
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-18.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface ICM_Node : NSObject

@property (nonatomic, getter = isInside) BOOL inside;
@property (nonatomic, getter = isGroundLevel) BOOL groundLevel;
@property (nonatomic, getter = isRoom) BOOL roomNode;
@property (nonatomic) CLLocationCoordinate2D nodeLocation;
@property (strong, nonatomic) UIImage *photo;
// neighboursAndWeights is a 2d array where the first column is the node connected to it
// and the second column is the distance
@property (strong, nonatomic) NSMutableArray *neighboursAndWeights;
@property (nonatomic) NSString* name;

- (id)initWithValues:(BOOL)inside Ground:(BOOL)ground Lattitude:(float)lattitude Longitude:(float)longitude Photo:(UIImage*)photo Name:(NSString*)name;

- (void)addNeighbour:(ICM_Node*)node;

@end

