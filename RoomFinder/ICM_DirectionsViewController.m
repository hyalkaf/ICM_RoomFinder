//
//  ICM_DirectionsViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_DirectionsViewController.h"
#include "ICM_Model.h"

@interface ICM_DirectionsViewController ()

@end

@implementation ICM_DirectionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    if ([sharedModel startNode])
    {
        [_startButton setTitle:[NSString stringWithFormat:@"From: %@", [[sharedModel startNode] name]] forState: UIControlStateNormal];
    }
    if ([sharedModel endNode])
    {
        
        [_destinationButton setTitle:[NSString stringWithFormat:@"To: %@", [[sharedModel endNode] name]] forState: UIControlStateNormal];
//        _destinationButton.text = [[sharedModel endNode] name];
 ///       _destinationButton.textAlignment = NSTextAlignmentCenter;
    }
    if ([sharedModel startNode] && [sharedModel endNode])
    {
        _calculateRouteButton.enabled = YES;
    }
    [self.view setNeedsDisplay];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
