//
//  ManagedLinkPost+CoreDataProperties.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 15.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "ManagedLinkPost+CoreDataProperties.h"

@implementation ManagedLinkPost (CoreDataProperties)

+ (NSFetchRequest<ManagedLinkPost *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ManagedLinkPost"];
}

@dynamic url;
@dynamic linkTitle;
@dynamic linkDescription;
@dynamic thumbnail;
@dynamic excerpt;
@dynamic author;

@end
