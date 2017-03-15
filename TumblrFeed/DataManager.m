//
//  DataManager.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 13.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "DataManager.h"

@interface DataManager ()
- (instancetype)init;
- (NSDate*)parseDateFromTimeStamp:(NSString*)timestamp;
@end

@implementation DataManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

+(instancetype)shared {
    static DataManager* _shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [self new];
    });
    return _shared;
}

-(void)setup {
    AppDelegate* app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    _context = app.persistentContainer.viewContext;
    _persistentStore = app.persistentContainer.persistentStoreCoordinator;
    
    _downloadManager = [DownloadManager shared];
    _downloadManager.delegate = self;
    _loginManager = [LoginManager shared];
    _loginManager.delegate = self;
    _xmlManager = [XMLParserManager shared];
    _xmlManager.delegate = self;
}

-(NSDate*)parseDateFromTimeStamp:(NSString*)timestamp {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [f numberFromString:timestamp];
    
    return [NSDate dateWithTimeIntervalSince1970:[myNumber doubleValue]];
}

- (void)deleteObjectsForEntity:(NSString *)entity error:(NSError**)error {
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:entity];
    NSArray* objects = [_context executeFetchRequest:request error:error];
    
    for (NSManagedObject* object in objects) {
        [_context deleteObject:object];
    }
}

// MARK: - LoginManager implementation
-(void)didValidateUser:(User *)user {
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"ManagedUser"];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"name == %@ ", user.name];
    request.predicate = predicate;
    
    NSError* error;
    NSArray<ManagedUser*>* result = [_context executeFetchRequest:request error:&error];
    
    if (error != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [_delegate didFailStoringUserWithError:error];
        });
        
        return;
    }
    
    if (result.count > 0) {
        [result[0] setName:user.name];
        [result[0] setNote:user.note];
        [result[0] setTitle:(int64_t)user.title];
        [result[0] setPostCount:(int64_t)user.posts];
        
        _currentUser = result[0];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_delegate didStoreUser:result[0] inContext:_context];
        });
    } else {
        ManagedUser* managedUser = [NSEntityDescription insertNewObjectForEntityForName:@"ManagedUser" inManagedObjectContext:_context];
        
        [managedUser setName:user.name];
        [managedUser setNote:user.note];
        [managedUser setTitle:(int64_t)user.title];
        [managedUser setPostCount:(int64_t)user.posts];
        
        _currentUser = managedUser;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_delegate didStoreUser:managedUser inContext:_context];
        });
    }
}

-(void)didFailValidatingWithError:(NSError *)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        [_delegate didFailStoringUserWithError:error];
    });
}

// MARK: - DownloadManager implementation
-(void)didDownloadPostsDataForUser:(ManagedUser* _Nonnull)user data:(NSData* _Nonnull)data {
    [_xmlManager setupWithData:data];
    BOOL success = [_xmlManager.parser parse];
    if (!success) {
        [_delegate didFailStoringPostsInContext:_context withError:nil];
    }
}

-(void)didFailDownloadingPostsWithError:(NSError* _Nonnull)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        [_delegate didFailStoringPostsInContext:_context withError:error];
    });
}

// MARK: - XMLParserManger implemantation
-(void)didParseLinkPost:(LinkPost *)linkPost {
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"ManagedLinkPost"];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"id == %@ ", linkPost.id];
    request.predicate = predicate;
    
    NSError* error;
    NSArray<ManagedLinkPost*>* result = [_context executeFetchRequest:request error:&error];
    
    if (error != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [_delegate didFailStoringPost:linkPost inContext:_context withError:error];
        });
        return;
    }
    
    if (result.count > 0) {
        [result[0] setId:(int)linkPost.id];
        [result[0] setType:linkPost.type];
        [result[0] setUrl:linkPost.url];
        [result[0] setAuthor:linkPost.author];
        [result[0] setExcerpt:linkPost.excerpt];
        [result[0] setLinkTitle:linkPost.linkTitle];
        [result[0] setThumbnail:linkPost.thumbNail];
        [result[0] setDate:[self parseDateFromTimeStamp:linkPost.date]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_delegate didStoreLinkPost:linkPost inContext:_context];
        });
    } else {
        ManagedLinkPost* managedLinkPost = [NSEntityDescription insertNewObjectForEntityForName:@"ManagedLinkPost" inManagedObjectContext:_context];
        
        [managedLinkPost setId:(int)linkPost.id];
        [managedLinkPost setType:linkPost.type];
        [managedLinkPost setUrl:linkPost.url];
        [managedLinkPost setAuthor:linkPost.author];
        [managedLinkPost setExcerpt:linkPost.excerpt];
        [managedLinkPost setLinkTitle:linkPost.linkTitle];
        [managedLinkPost setThumbnail:linkPost.thumbNail];
        [managedLinkPost setDate:[self parseDateFromTimeStamp:linkPost.date]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_delegate didStoreLinkPost:linkPost inContext:_context];
        });
    }
}

-(void)didParsePhotoPost:(PhotoPost *)photoPost {
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"ManagedPhotoPost"];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"id == %@ ", photoPost.id];
    request.predicate = predicate;
    
    NSError* error;
    NSArray<ManagedPhotoPost*>* result = [_context executeFetchRequest:request error:&error];
    
    if (error != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [_delegate didFailStoringPost:photoPost inContext:_context withError:error];
        });
        return;
    }
    
    if (result.count > 0) {
        [result[0] setId:(int)photoPost.id];
        [result[0] setType:photoPost.type];
        [result[0] setCaption:photoPost.caption];
        [result[0] setData:photoPost.data];
        [result[0] setData64:photoPost.data64];
        [result[0] setLink:photoPost.link];
        [result[0] setSource:photoPost.source];
        [result[0] setDate:[self parseDateFromTimeStamp:photoPost.date]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_delegate didStorePhotoPost:photoPost inContext:_context];
        });
    } else {
        ManagedPhotoPost* managedPhotoPost = [NSEntityDescription insertNewObjectForEntityForName:@"ManagedPhotoPost" inManagedObjectContext:_context];
        
        [managedPhotoPost setId:(int)photoPost.id];
        [managedPhotoPost setType:photoPost.type];
        [managedPhotoPost setCaption:photoPost.caption];
        [managedPhotoPost setData:photoPost.data];
        [managedPhotoPost setData64:photoPost.data64];
        [managedPhotoPost setLink:photoPost.link];
        [managedPhotoPost setSource:photoPost.source];
        [managedPhotoPost setDate:[self parseDateFromTimeStamp:photoPost.date]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_delegate didStorePhotoPost:photoPost inContext:_context];
        });
    }
}

-(void)didParseRegularPost:(RegularPost *)regularPost {
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"ManagedRegularPost"];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"id == %@ ", regularPost.id];
    request.predicate = predicate;
    
    NSError* error;
    NSArray<ManagedRegularPost*>* result = [_context executeFetchRequest:request error:&error];
    
    if (error != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [_delegate didFailStoringPost:regularPost inContext:_context withError:error];
        });
        return;
    }
    
    if (result.count > 0) {
        [result[0] setId:(int)regularPost.id];
        [result[0] setType:regularPost.type];
        [result[0] setRegularBody:regularPost.regularBody];
        [result[0] setRegularText:regularPost.regularTitle];
        [result[0] setDate:[self parseDateFromTimeStamp:regularPost.date]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_delegate didStoreRegularPost:regularPost inContext:_context];
        });
    } else {
        ManagedRegularPost* managedRegularPost = [NSEntityDescription insertNewObjectForEntityForName:@"ManagedRegularPost" inManagedObjectContext:_context];
        
        [managedRegularPost setId:(int)regularPost.id];
        [managedRegularPost setType:regularPost.type];
        [managedRegularPost setRegularBody:regularPost.regularBody];
        [managedRegularPost setRegularText:regularPost.regularTitle];
        [managedRegularPost setDate:[self parseDateFromTimeStamp:regularPost.date]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_delegate didStoreRegularPost:regularPost inContext:_context];
        });
    }
}

-(void)didUpdateUser:(User *)user {
    if (user.note != nil) {
        _currentUser.note = user.note;
    }
    if (user.note != nil) {
        _currentUser.title = (int)user.title;
    }
    if (user.posts != nil) {
        _currentUser.postCount = (int)user.posts;
    }
}

-(void)didFailParsingXMLWithError:(NSError *)error {
    
}

-(void)didStartParsingDocument {
    
}

-(void)didEndParsingDocument {
    NSError* error;
    [_context save:&error];
    
    
    if (error != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [_delegate didFailSavingContext:_context withError:error];
        });
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [_delegate didEndXMLDocument];
        });
    }
}


@end
