//
//  ManagedPost+CoreDataProperties.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 14.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "ManagedPost+CoreDataProperties.h"

@implementation ManagedPost (CoreDataProperties)

+ (NSFetchRequest<ManagedPost *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ManagedPost"];
}

@dynamic id;
@dynamic type;
@dynamic date;
@dynamic tags;

@end
