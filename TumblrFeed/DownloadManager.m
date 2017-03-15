//
//  DownloadManager.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 13.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "DownloadManager.h"

@interface DownloadManager ()
- (instancetype)init;
@end

@implementation DownloadManager

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

+(instancetype)shared {
    static DownloadManager* _shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [self new];
    });
    return _shared;
}

-(void)setup {
    _session = [NSURLSession sharedSession];
}

-(void)fetchDataForUser:(ManagedUser*)user {
    
    NSString* path = [NSString stringWithFormat:@"https://%@.tumblr.com/api/read?filter=text", user.name];
    NSURL* url = [NSURL URLWithString:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [[_session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate didFailDownloadingPostsWithError:error];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate didDownloadPostsDataForUser:user data:data];
            });
        }
    }] resume];
}

@end
