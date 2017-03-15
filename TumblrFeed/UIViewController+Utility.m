//
//  UIViewController+Utility.m
//  TabApplication
//
//  Created by Dominik Kowalski on 02/03/2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "UIViewController+Utility.h"

@implementation UIViewController (Utility)

-(void)presentAlertViewControllerWithTitle:(NSString*)title message:(NSString*)message andButton:(NSString*)button withAction:(void(^)())actionHandler {
    UIAlertController* controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* action = [UIAlertAction actionWithTitle:button style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (actionHandler != nil) {
            actionHandler();
        }
    }];
    
    [controller addAction:action];
    
    [self presentViewController:controller animated:true completion:nil];
}



@end
