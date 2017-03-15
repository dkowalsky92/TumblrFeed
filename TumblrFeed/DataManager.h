//
//  DataManager.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 13.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "XMLParserManager.h"
#import "DownloadManager.h"
#import "LoginManager.h"
#import "AppDelegate.h"
#import "ManagedUser+CoreDataClass.h"
#import "ManagedPost+CoreDataClass.h"
#import "ManagedLinkPost+CoreDataClass.h"
#import "ManagedRegularPost+CoreDataClass.h"
#import "ManagedPhotoPost+CoreDataClass.h"
#import "PhotoPost.h"
#import "RegularPost.h"
#import "LinkPost.h"
#import "Post.h"
#import "User.h"

@protocol DataManagerDelegate <NSObject>
@optional
-(void)didFailSavingContext:(NSManagedObjectContext* _Nonnull)context withError:(NSError* _Nullable)error;

-(void)didStoreRegularPost:(RegularPost* _Nonnull)regularPost inContext:(NSManagedObjectContext* _Nonnull)context;
-(void)didStorePhotoPost:(PhotoPost* _Nonnull)photoPost inContext:(NSManagedObjectContext* _Nonnull)context;
-(void)didStoreLinkPost:(LinkPost* _Nonnull)linkPost inContext:(NSManagedObjectContext* _Nonnull)context;

-(void)didFailStoringPost:(Post* _Nonnull)post inContext:(NSManagedObjectContext* _Nonnull)context withError:(NSError* _Nullable)error;
-(void)didFailStoringPostsInContext:(NSManagedObjectContext* _Nonnull)context withError:(NSError* _Nullable)error;

-(void)didStoreUser:(ManagedUser* _Nonnull)user inContext:(NSManagedObjectContext* _Nonnull)context;
-(void)didFailStoringUserWithError:(NSError* _Nullable)error;

-(void)didStartXMLDocument;
-(void)didEndXMLDocument;
-(void)didStartElement:(NSString* _Nonnull)element;
-(void)didEndElement:(NSString* _Nonnull)element;

@end

@interface DataManager : NSObject <XMLParserManagerDelegate, DownloadManagerDelegate, LoginManagerDelegate>

@property (nonatomic) NSManagedObjectContext* _Nonnull context;
@property (nonatomic) NSPersistentStoreCoordinator* _Nonnull persistentStore;
@property (nonatomic, nullable) id<DataManagerDelegate> delegate;
@property (nonatomic, nullable) ManagedUser* currentUser;
@property (nonatomic, nonnull) LoginManager* loginManager;
@property (nonatomic, nonnull) XMLParserManager* xmlManager;
@property (nonatomic, nonnull) DownloadManager* downloadManager;

+(instancetype _Nonnull)shared;
-(void)setup;
-(void)deleteObjectsForEntity:(NSString * _Nonnull)entity error:(NSError* _Nullable* _Nullable)error;

@end
