//
//  ManagedPhotoPost+CoreDataProperties.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 15.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "ManagedPhotoPost+CoreDataProperties.h"

@implementation ManagedPhotoPost (CoreDataProperties)

+ (NSFetchRequest<ManagedPhotoPost *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ManagedPhotoPost"];
}

@dynamic link;
@dynamic caption;
@dynamic source;
@dynamic data64;
@dynamic data;

@end
