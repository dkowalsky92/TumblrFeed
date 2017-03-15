//
//  LoginManager.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 14.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ManagedUser+CoreDataClass.h"
#import "ManagedPost+CoreDataClass.h"
#import "User.h"

@protocol LoginManagerDelegate <NSObject>
@optional
-(void)didFailValidatingWithError:(NSError* _Nonnull)error;
-(void)didValidateUser:(User* _Nonnull)user;
@end

@interface LoginManager : NSObject

@property (nonatomic) NSURLSession* _Nonnull session;
@property (nonatomic, nullable) id<LoginManagerDelegate> delegate;

+(instancetype _Nonnull)shared;
-(void)setup;
-(void)loginWithUsername:(NSString* _Nonnull)username;

@end
