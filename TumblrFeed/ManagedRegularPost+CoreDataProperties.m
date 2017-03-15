//
//  ManagedRegularPost+CoreDataProperties.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 15.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "ManagedRegularPost+CoreDataProperties.h"

@implementation ManagedRegularPost (CoreDataProperties)

+ (NSFetchRequest<ManagedRegularPost *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ManagedRegularPost"];
}

@dynamic regularText;
@dynamic regularBody;

@end
