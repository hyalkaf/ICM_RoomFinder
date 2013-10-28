//
//  ICM_PictureViewController.h
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-27.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICM_PictureViewController : UIViewController <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;


- (void)centerScrollViewContents;
- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer;
- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer*)recognizer;
@end
