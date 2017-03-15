//
//  ManagedPhotoPost+CoreDataProperties.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 15.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "ManagedPhotoPost+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedPhotoPost (CoreDataProperties)

+ (NSFetchRequest<ManagedPhotoPost *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *link;
@property (nullable, nonatomic, copy) NSString *caption;
@property (nullable, nonatomic, copy) NSString *source;
@property (nullable, nonatomic, copy) NSString *data64;
@property (nullable, nonatomic, retain) NSData *data;

@end

NS_ASSUME_NONNULL_END
