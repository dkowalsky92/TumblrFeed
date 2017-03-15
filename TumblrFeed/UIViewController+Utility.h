//
//  UIViewController+Utility.h
//  TabApplication
//
//  Created by Dominik Kowalski on 02/03/2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (Utility)
-(void)presentAlertViewControllerWithTitle:(NSString* _Nonnull)title message:(NSString* _Nonnull)message andButton:(NSString* _Nonnull)button withAction:(void(^ _Nullable)())action;
@end
