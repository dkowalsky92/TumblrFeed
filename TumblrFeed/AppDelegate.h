//
//  AppDelegate.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 04/03/2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

