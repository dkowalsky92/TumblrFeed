//
//  DownloadManager.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 13.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ManagedUser+CoreDataClass.h"
#import "ManagedPost+CoreDataClass.h"
#import "User.h"

@protocol DownloadManagerDelegate <NSObject>
@optional
-(void)didFailDownloadingPostsWithError:(NSError* _Nonnull)error;
-(void)didDownloadPostsDataForUser:(ManagedUser* _Nonnull)user data:(NSData* _Nonnull)data;
@end

@interface DownloadManager : NSObject

@property (nonatomic) NSURLSession* _Nonnull session;
@property (nonatomic, nullable) id<DownloadManagerDelegate> delegate;

+(instancetype _Nonnull)shared;
-(void)setup;
-(void)fetchDataForUser:(ManagedUser* _Nonnull)user;

@end
