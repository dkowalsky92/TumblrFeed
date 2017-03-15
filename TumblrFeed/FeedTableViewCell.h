//
//  FeedTableViewCell.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 04/03/2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#define FEED_CELL_IDENTIFIER "FoodTableViewCell"

#import <UIKit/UIKit.h>
#import "ConstraintUtility.h"
#import "UIView+Colors.h"

@interface FeedTableViewCell : UITableViewCell

@property (strong, nonatomic) UIView* topView;
@property (strong, nonatomic) UIView* bottomView;
@property (strong, nonatomic) UIView* postContentView;
@property (strong, nonatomic) UILabel* nicknameLabel;
@property (strong, nonatomic) UIImageView* userImage;
@property (strong, nonatomic) UILabel* noteLabel;

-(void)configureCell;

@end
