//
//  Post.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 13.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "Post.h"

@implementation Post

-(instancetype)initWithId:(NSString*)id type:(NSString*)type date:(NSString*)date {
    self = [super init];
    if (self) {
        _id = id;
        _type = type;
        _date = date;
    }
    return self;
}

@end
