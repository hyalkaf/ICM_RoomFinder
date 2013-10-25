//
//  ICM_ViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_ViewController.h"
#import "ICM_Node.h"

@interface ICM_ViewController ()

@end

@implementation ICM_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    ICM_Node *node = [[ICM_Node alloc] initWithValues:YES Ground:YES Lattitude:51.078077 Longitude:-114.129432 Photo:[[UIImage alloc] initWithContentsOfFile:@"panorama1.jpg"]];

    NSLog(@"inside = %hhd", [node isInside]);
    NSLog(@"groundLevel = %hhd", [node isGroundLevel]);
    NSLog(@"lattitude = %f", node.location.latitude);
    NSLog(@"longitude = %f", node.location.longitude);
    if (node.photo == Nil)
        NSLog(@"Photo is nil");
    else
        NSLog(@"Photo is not nil");
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
