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
    _x = 0;
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    _searchResults = [[NSMutableArray alloc] initWithCapacity:[[sharedModel nodeList] count]];
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
    if (tableView == self.searchDisplayController.searchResultsTableView)
        return [_searchResults count];
    else
        return [[sharedModel nodeList] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    if (tableView == self.searchDisplayController.searchResultsTableView)
        _x = 0;
    else
        _x = 1;
    
    if (_x == 1)
    {
        cell.textLabel.text = [[[sharedModel nodeList] objectAtIndex:indexPath.row] name];
        if ([[sharedModel endNode] isEqual:[[sharedModel nodeList] objectAtIndex:indexPath.row]])
            cell.textLabel.textColor = [UIColor lightGrayColor];
    }
    else
    {
        cell.textLabel.text = [[_searchResults objectAtIndex:indexPath.row] name];
        if ([[sharedModel endNode] isEqual:[_searchResults objectAtIndex:indexPath.row]])
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
    
    if (_x == 1)
        [sharedModel setStartNode:[[sharedModel nodeList] objectAtIndex:indexPath.row]];
    else
    {
        for (int i = 0; i < [[sharedModel nodeList] count]; i++)
        {
            if ([[[sharedModel nodeList] objectAtIndex:i] isEqual:[_searchResults objectAtIndex:indexPath.row]])
            {
                [sharedModel setStartNode:[[sharedModel nodeList] objectAtIndex:i]];
            }
        }
    }

    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:[self.navigationController.viewControllers count]-3] animated:YES];
    //[self.navigationController popViewControllerAnimated:YES];

//    NSLog(@"Name of start node = %@", [[sharedModel startNode] name]);
}

-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [_searchResults removeAllObjects];
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
    _searchResults = [NSMutableArray arrayWithArray:[[sharedModel nodeList] filteredArrayUsingPredicate:predicate]];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

@end
