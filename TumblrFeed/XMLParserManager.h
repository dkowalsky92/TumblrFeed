//
//  XMLParserManager.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 06.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegularPost.h"
#import "LinkPost.h"
#import "PhotoPost.h"
#import "Post.h"
#import "User.h"

@protocol XMLParserManagerDelegate <NSObject>
@optional
-(void)didFailParsingXMLWithError:(NSError* _Nonnull)error;
-(void)didStartParsingDocument;
-(void)didEndParsingDocument;
-(void)didParseRegularPost:(RegularPost* _Nonnull)post;
-(void)didParseLinkPost:(LinkPost* _Nonnull)post;
-(void)didParsePhotoPost:(PhotoPost* _Nonnull)post;
-(void)didUpdateUser:(User* _Nonnull)user;

@end

@interface XMLParserManager : NSObject <NSXMLParserDelegate>

@property (nonatomic, nonnull) NSXMLParser* parser;
@property (nonatomic, nullable) NSString* currentElement;
@property (nonatomic, nullable) NSString* currentValue;
@property (nonatomic, nonnull) NSString* postType;
@property (nonatomic, nullable) RegularPost* regularPost;
@property (nonatomic, nullable) LinkPost* linkPost;
@property (nonatomic, nullable) PhotoPost* photoPost;
@property (nonatomic, nullable) User* currentUser;
@property (nonatomic, nullable) id<XMLParserManagerDelegate> delegate;

+(instancetype _Nonnull)shared;
-(void)setup;
-(void)setupWithData:(NSData* _Nonnull)data;

@end
