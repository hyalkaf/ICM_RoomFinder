//
//  ICM_Model.h
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICM_Model : NSObject

@property (strong, nonatomic) NSMutableArray *buildingList;
@property (strong, nonatomic) NSMutableArray *nodeList;
@property (strong, nonatomic) NSMutableArray *adjacancyMatrix;

+ (id)sharedModel;

@end
