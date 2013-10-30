//
//  ICM_ViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_ViewController.h"
#import "ICM_Node.h"
#import "ICM_Model.h"

@interface ICM_ViewController ()

@end

@implementation ICM_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [sharedModel setStartNode:[[sharedModel nodeList] objectAtIndex:3]];
//    [sharedModel setEndNode:[[sharedModel nodeList] objectAtIndex:8]];
//    [sharedModel setShortestPath:[sharedModel dijsktra:[sharedModel startNode] EndNode:[sharedModel endNode]]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    [sharedModel setStartNode:nil];
    [sharedModel setEndNode:nil];
}

@end
