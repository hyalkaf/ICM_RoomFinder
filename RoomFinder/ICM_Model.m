//
//  ICM_Model.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_Model.h"
#import "ICM_Node.h"

@implementation ICM_Model

- (id)init
{
    if (self = [super init])
    {
        // default list of buildings
        _buildingList = [[NSMutableArray alloc] init];
        [_buildingList addObject:@"MFH - Murray Fraser Hall"];
        [_buildingList addObject:@"MS - Mathematical Science"];
        [_buildingList addObject:@"ST - Science Theatres"];
        [_buildingList addObject:@"CH - Craigie Hall"];
        
        //_startNode = [[ICM_Node alloc] init];
        //_endNode = [[ICM_Node alloc] init];
        
        _nodeList = [[NSMutableArray alloc] init];
        
        // adds the initial 4 nodes
        [_nodeList addObject:[[ICM_Node alloc] initWithValues:YES Ground:YES Lattitude:51.078077 Longitude:-114.129432 Photo:[UIImage imageNamed:@"1.jpg"] Name:@"Node 0"]];
        [_nodeList addObject:[[ICM_Node alloc] initWithValues:YES Ground:YES Lattitude:51.078077 Longitude:-114.129432 Photo:[UIImage imageNamed:@"2.jpg"] Name:@"Node 1"]];
        [_nodeList addObject:[[ICM_Node alloc] initWithValues:YES Ground:YES Lattitude:51.078077 Longitude:-114.129432 Photo:[UIImage imageNamed:@"3.jpg"] Name:@"Node 2"]];
        [_nodeList addObject:[[ICM_Node alloc] initWithValues:YES Ground:YES Lattitude:51.078077 Longitude:-114.129432 Photo:[UIImage imageNamed:@"4.jpg"] Name:@"Node 3"]];
        
        // neighbours for node 0
        [[_nodeList objectAtIndex:0] addNeighbour:[_nodeList objectAtIndex:1] Distance:[NSNumber numberWithInt:1]];
        [[_nodeList objectAtIndex:0] addNeighbour:[_nodeList objectAtIndex:2] Distance:[NSNumber numberWithInt:2]];
        
        // neighbours for node 1
        [[_nodeList objectAtIndex:1] addNeighbour:[_nodeList objectAtIndex:0] Distance:[NSNumber numberWithInt:1]];
        [[_nodeList objectAtIndex:1] addNeighbour:[_nodeList objectAtIndex:3] Distance:[NSNumber numberWithInt:1]];
        
        // neighbours for node 2
        [[_nodeList objectAtIndex:2] addNeighbour:[_nodeList objectAtIndex:0] Distance:[NSNumber numberWithInt:2]];
        [[_nodeList objectAtIndex:2] addNeighbour:[_nodeList objectAtIndex:3] Distance:[NSNumber numberWithInt:2]];
        
        // neighbours for node 3
        [[_nodeList objectAtIndex:3] addNeighbour:[_nodeList objectAtIndex:1] Distance:[NSNumber numberWithInt:1]];
        [[_nodeList objectAtIndex:3] addNeighbour:[_nodeList objectAtIndex:2] Distance:[NSNumber numberWithInt:2]];
        
        _adjacancyMatrix = [[NSMutableArray alloc] initWithCapacity:[_nodeList count]];
        
        // creates the 2d adjacanecy matrix
        for (int i = 0; i < [_nodeList count]; i++)
        {
            [_adjacancyMatrix addObject:[[NSMutableArray alloc] initWithCapacity:[_nodeList count]]];
        }
        
        // sets every point in the adj matrix to -1 (-1 = no connection)
        for (int x = 0; x < [_nodeList count]; x++)
        {
            for (int y = 0; y < [_nodeList count]; y++)
            {
                [[_adjacancyMatrix objectAtIndex:x] insertObject:[NSNumber numberWithInt:-1] atIndex:y];
            }
        }
        
        // reads from neighboursAndWeights for each node and then updates the adj matrix accordingly
        for (int x = 0; x < [_nodeList count]; x++)
        {
            for (int y = 0; y < [_nodeList count]; y++)
            {
                if (x != y)
                {
                    for (int z = 0; z < [[[_nodeList objectAtIndex:y] neighboursAndWeights] count]; z++)
                    {
                        NSString *tempName1 = [[[[[_nodeList objectAtIndex:y] neighboursAndWeights] objectAtIndex:z] objectAtIndex:0] name];
                        NSString *tempName2 = [[_nodeList objectAtIndex:x] name];
                        if ([tempName1 isEqualToString:tempName2])
                        {
                            NSNumber *tempDistance = [[[[_nodeList objectAtIndex:y] neighboursAndWeights] objectAtIndex:z] objectAtIndex:1];
                            [[_adjacancyMatrix objectAtIndex:x] insertObject:tempDistance atIndex:y];
                        }
                    }
                }
            }
        }
        
        // debug function, displays a 4x4 adj matrix, must be updated for smaller or larger matrices
//                for (int x = 0; x < [_nodeList count]; x++)
//                {
//                    NSLog(@"%@ %@ %@ %@", [[_adjacancyMatrix objectAtIndex:x] objectAtIndex:0], [[_adjacancyMatrix objectAtIndex:x] objectAtIndex:1], [[_adjacancyMatrix objectAtIndex:x] objectAtIndex:2], [[_adjacancyMatrix objectAtIndex:x] objectAtIndex:3]);
//                }
        
        
    }
    return self;
}

- (void)addStartNode:(ICM_Node*)nodel;
{
    _startNode = [[ICM_Node alloc] init];
    _startNode = nodel;
}

// singleton function
+ (id)sharedModel {
    static ICM_Model *singleModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleModel = [[self alloc] init];
    });
    return singleModel;
}


@end
