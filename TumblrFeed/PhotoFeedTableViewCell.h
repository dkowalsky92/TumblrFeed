//
//  PhotoFeedTableViewCell.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 15.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#define PHOTO_FEED_CELL_IDENTIFIER "PhotoFeedTableViewCell"

#import "FeedTableViewCell.h"

@interface PhotoFeedTableViewCell : FeedTableViewCell

@property (nonatomic) UILabel* photoTitle;
@property (nonatomic) UIImageView* photoImage;

@end
