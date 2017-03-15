//
//  ManagedUser+CoreDataProperties.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 14.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "ManagedUser+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedUser (CoreDataProperties)

+ (NSFetchRequest<ManagedUser *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *note;
@property (nonatomic) int64_t postCount;
@property (nonatomic) int64_t title;

@end

NS_ASSUME_NONNULL_END
