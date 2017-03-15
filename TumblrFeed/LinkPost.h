//
//  LinkPost.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 15.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "Post.h"

@interface LinkPost : Post

@property (nonatomic, nonnull) NSString* url;
@property (nonatomic, nullable) NSString* linkTitle;
@property (nonatomic, nullable) NSString* linkDescription;
@property (nonatomic, nullable) NSString* thumbNail;
@property (nonatomic, nullable) NSString* excerpt;
@property (nonatomic, nullable) NSString* author;

@end
