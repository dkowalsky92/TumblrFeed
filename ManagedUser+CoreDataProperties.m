//
//  ManagedUser+CoreDataProperties.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 14.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "ManagedUser+CoreDataProperties.h"

@implementation ManagedUser (CoreDataProperties)

+ (NSFetchRequest<ManagedUser *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ManagedUser"];
}

@dynamic name;
@dynamic note;
@dynamic postCount;
@dynamic title;

@end
