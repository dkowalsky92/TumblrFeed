//
//  User.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 13.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, nonnull) NSString* name;
@property (nonatomic, nullable) NSString* title;
@property (nonatomic, nullable) NSString* note;
@property (nonatomic, nullable) NSString* posts;

-(instancetype _Nonnull)initWithName:(NSString* _Nonnull)name title:(NSString* _Nullable)title note:(NSString* _Nullable)note posts:(NSString* _Nullable)posts;

@end
