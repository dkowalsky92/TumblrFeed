//
//  ManagedLinkPost+CoreDataProperties.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 15.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "ManagedLinkPost+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedLinkPost (CoreDataProperties)

+ (NSFetchRequest<ManagedLinkPost *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *url;
@property (nullable, nonatomic, copy) NSString *linkTitle;
@property (nullable, nonatomic, copy) NSString *linkDescription;
@property (nullable, nonatomic, copy) NSString *thumbnail;
@property (nullable, nonatomic, copy) NSString *excerpt;
@property (nullable, nonatomic, copy) NSString *author;

@end

NS_ASSUME_NONNULL_END
