//
//  ICM_Model.h
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICM_Node.h"

@interface ICM_Model : NSObject

@property (strong, nonatomic) NSMutableArray *buildingList;
@property (strong, nonatomic) NSMutableArray *nodeList;
@property (strong, nonatomic) NSMutableArray *adjacancyMatrix;
@property (strong, nonatomic) ICM_Node *startNode;
@property (strong, nonatomic) ICM_Node *endNode;


+ (id)sharedModel;
- (void)addStartNode:(ICM_Node*)nodel;

@end
