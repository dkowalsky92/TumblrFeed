//
//  User.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 13.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "User.h"

@implementation User

-(instancetype)initWithName:(NSString*)name title:(NSString*)title note:(NSString*)note posts:(NSString*)posts {
    self = [super init];
    if (self) {
        _name = name;
        _title = title;
        _note = note;
        _posts = posts;
    }
    return self;
}

@end
