//
//  LoginManager.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 14.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "LoginManager.h"

@implementation LoginManager

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

+(instancetype)shared {
    static LoginManager* _shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [self new];
    });
    return _shared;
}

-(void)setup {
    _session = [NSURLSession sharedSession];
}

-(void)loginWithUsername:(NSString*)username {
    
    NSString* path = [NSString stringWithFormat:@"https://%@.tumblr.com/api/read", username];
    NSURL* url = [NSURL URLWithString:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [[_session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate didFailValidatingWithError:error];
            });
        } else {
            User* user = [[User alloc]initWithName:username title:nil note:nil posts:nil];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate didValidateUser:user];
            });
        }
    }] resume];
}

@end
