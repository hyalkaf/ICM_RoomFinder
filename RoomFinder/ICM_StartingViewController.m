//
//  ICM_StartingViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_StartingViewController.h"
#import "ICM_Model.h"

@interface ICM_StartingViewController ()

@end

@implementation ICM_StartingViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.searchDisplayController.displaysSearchBarInNavigationBar = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    [self.tableView reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    return [[sharedModel nodeList] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    cell.textLabel.text = [[[sharedModel nodeList] objectAtIndex:indexPath.row] name];
    if ([[sharedModel endNode] isEqual:[[sharedModel nodeList] objectAtIndex:indexPath.row]])
    {
        cell.textLabel.textColor = [UIColor lightGrayColor];
    }
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tv willSelectRowAtIndexPath:(NSIndexPath *)path
{
    // Determine if row is selectable based on the NSIndexPath.
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    
    if ([[sharedModel endNode] isEqual:[[sharedModel nodeList] objectAtIndex:path.row]])
    {
        return nil;
    }
    
    return path;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    
    [sharedModel setStartNode:[[sharedModel nodeList] objectAtIndex:indexPath.row]];

    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:[self.navigationController.viewControllers count]-3] animated:YES];
    //[self.navigationController popViewControllerAnimated:YES];

//    NSLog(@"Name of start node = %@", [[sharedModel startNode] name]);

}

@end
