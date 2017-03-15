//
//  ManagedPost+CoreDataProperties.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 14.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "ManagedPost+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedPost (CoreDataProperties)

+ (NSFetchRequest<ManagedPost *> *)fetchRequest;

@property (nonatomic) int64_t id;
@property (nullable, nonatomic, copy) NSString *type;
@property (nullable, nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, copy) NSString *tags;
@end

NS_ASSUME_NONNULL_END
