//
//  ICM_StartingViewController.h
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICM_Model.h"

@interface ICM_StartingViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>


@property (strong, nonatomic) NSMutableArray *searchResults;
@property (strong, nonatomic) IBOutlet UITableView *startingSearchBar;
@property int x;

@end
