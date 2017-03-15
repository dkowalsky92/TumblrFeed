//
//  RegularFeedTableViewCell.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 15.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#define REGULAR_FEED_CELL_IDENTIFIER "RegularFeedTableViewCell"

#import "FeedTableViewCell.h"


@interface RegularFeedTableViewCell : FeedTableViewCell

@property (strong, nonatomic) UILabel* titleLabel;
@property (strong, nonatomic) UILabel* bodyLabel;

@end
