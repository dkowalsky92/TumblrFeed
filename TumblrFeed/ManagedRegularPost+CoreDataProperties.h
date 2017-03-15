//
//  ManagedRegularPost+CoreDataProperties.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 15.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "ManagedRegularPost+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedRegularPost (CoreDataProperties)

+ (NSFetchRequest<ManagedRegularPost *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *regularText;
@property (nullable, nonatomic, copy) NSString *regularBody;

@end

NS_ASSUME_NONNULL_END
