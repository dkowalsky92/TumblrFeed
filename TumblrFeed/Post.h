//
//  Post.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 13.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property (nonatomic, nonnull) NSString* id;
@property (nonatomic, nullable) NSString* type;
@property (nonatomic, nullable) NSString* date;
@property (nonatomic, nonnull) NSString* tags;

-(instancetype _Nonnull)initWithId:(NSString* _Nonnull)id type:(NSString* _Nullable)type date:(NSString* _Nullable)date;

@end
