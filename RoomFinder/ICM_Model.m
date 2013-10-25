//
//  ICM_Model.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_Model.h"

@implementation ICM_Model

- (id)init
{
    if (self = [super init])
    {
        _buildingList = [[NSMutableArray alloc] init];
        [_buildingList addObject:@"MFH - Murray Fraser Hall"];
        [_buildingList addObject:@"MS - Mathematical Science"];
        [_buildingList addObject:@"ST - Science Theatres"];
        [_buildingList addObject:@"CH - Craigie Hall"];
        

    }
    return self;
}

@end
