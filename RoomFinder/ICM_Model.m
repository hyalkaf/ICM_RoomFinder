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
        _shortestPath = [[NSArray alloc] init];
        // default list of buildings
        _buildingList = [[NSMutableArray alloc] init];
        [_buildingList addObject:@"MFH - Murray Fraser Hall"];
        [_buildingList addObject:@"MS - Mathematical Science"];
        [_buildingList addObject:@"ST - Science Theatres"];
        [_buildingList addObject:@"CH - Craigie Hall"];
               
        _nodeList = [[NSMutableArray alloc] init];

        // adds the initial 4 nodes
        [_nodeList addObject:[[ICM_Node alloc] initWithValues:YES Ground:YES Lattitude:51.0779 Longitude:-114.128651 Photo:[UIImage imageNamed:@"1.jpg"] Name:@"Node 0"]];
        [_nodeList addObject:[[ICM_Node alloc] initWithValues:YES Ground:YES Lattitude:51.078235 Longitude:-114.127691 Photo:[UIImage imageNamed:@"2.jpg"] Name:@"Node 1"]];
        [_nodeList addObject:[[ICM_Node alloc] initWithValues:YES Ground:YES Lattitude:51.0776 Longitude:-114.128053 Photo:[UIImage imageNamed:@"3.jpg"] Name:@"Node 2"]];
        [_nodeList addObject:[[ICM_Node alloc] initWithValues:YES Ground:YES Lattitude:51.077772 Longitude:-114.127238 Photo:[UIImage imageNamed:@"4.jpg"] Name:@"Node 3"]];
        
        // neighbours for node 0
        [[_nodeList objectAtIndex:0] addNeighbour:[_nodeList objectAtIndex:1] Distance:[NSNumber numberWithInt:1]];
        [[_nodeList objectAtIndex:0] addNeighbour:[_nodeList objectAtIndex:2] Distance:[NSNumber numberWithInt:20]];
        
        // neighbours for node 1
        [[_nodeList objectAtIndex:1] addNeighbour:[_nodeList objectAtIndex:0] Distance:[NSNumber numberWithInt:1]];
        [[_nodeList objectAtIndex:1] addNeighbour:[_nodeList objectAtIndex:3] Distance:[NSNumber numberWithInt:1]];
        
        // neighbours for node 2
        [[_nodeList objectAtIndex:2] addNeighbour:[_nodeList objectAtIndex:0] Distance:[NSNumber numberWithInt:20]];
        [[_nodeList objectAtIndex:2] addNeighbour:[_nodeList objectAtIndex:3] Distance:[NSNumber numberWithInt:1]];
        
        // neighbours for node 3
        [[_nodeList objectAtIndex:3] addNeighbour:[_nodeList objectAtIndex:1] Distance:[NSNumber numberWithInt:1]];
        [[_nodeList objectAtIndex:3] addNeighbour:[_nodeList objectAtIndex:2] Distance:[NSNumber numberWithInt:1]];
        
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

- (NSArray*)dijsktra:(ICM_Node*)startNode EndNode:(ICM_Node*)endNode;
{
    int n = [_nodeList count];
    float distance[n];
    float precede[n];
    int source;
    int destination;
    BOOL visit[n];
    for (int i = 0; i < [_nodeList count]; i++)
    {
        if ([[_nodeList objectAtIndex:i] isEqual:startNode])
            source = i;
        if ([[_nodeList objectAtIndex:i] isEqual:endNode])
            destination = i;
    }
    for (int i = 0; i < n; i++)
    {
        distance[i] = 99999;
        precede[i] = 99999;
    }
    distance[source] = 0;
    int current = source;
    while (current != destination)
    {
        float distcurr = distance[current];
        float smalldist = 99999;
        int k = -1;
        visit[current] = true;
        for (int i = 0; i < n; i++)
        {
            if (visit[i])
                continue;
            int newdist;
            if ([[[_adjacancyMatrix objectAtIndex:current] objectAtIndex:i] integerValue] != -1)
                newdist = distcurr + [[[_adjacancyMatrix objectAtIndex:current] objectAtIndex:i] integerValue];
            else
                newdist = 999999;
            if (newdist < distance[i])
            {
                distance[i] = newdist;
                precede[i] = current;
            }
            if (distance[i] < smalldist)
            {
                smalldist = distance[i];
                k = i;
            }
        }
        current = k;
    }
    int i = destination;
    int finall = 0;
    int path[n];
    path[finall] = destination;
    finall++;
    while (precede[i] != source)
    {
        i = precede[i];
        path[finall] = i;
        finall++;
    }
    path[finall] = source;
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:(finall+1)];
    int temp = finall;
    for (int x = 0; x < finall+1; x++)
    {
        [result insertObject:[_nodeList objectAtIndex:(path[temp])] atIndex:x];
        temp--;
    }
    return result;
}

@end
