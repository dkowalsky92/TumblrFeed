//
//  PhotoPost.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 15.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "Post.h"

@interface PhotoPost : Post

@property (nonatomic, nullable) NSString* link;
@property (nonatomic, nullable) NSString* caption;
@property (nonatomic, nullable) NSString* source;
@property (nonatomic, nullable) NSString* data64;
@property (nonatomic, nullable) NSData* data;

@end
