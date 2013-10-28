//
//  ICM_EndingViewController.h
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-26.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICM_Model.h"

@interface ICM_EndingViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *endingSearchBar;
@property (strong, nonatomic) NSMutableArray *searchResults;
@property int x;

@end
