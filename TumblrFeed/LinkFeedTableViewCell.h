//
//  LinkFeedTableViewCell.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 15.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//
#define LINK_FEED_CELL_IDENTIFIER "LinkFeedTableViewCell"

#import "FeedTableViewCell.h"

@interface LinkFeedTableViewCell : FeedTableViewCell

@property (strong, nonatomic) UIButton* _Nonnull linkButton;
@property (nonatomic, nullable) NSURL* linkUrl;

-(void)openLink:(UIButton* _Nonnull)sender;

@end
