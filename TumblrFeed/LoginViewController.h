//
//  LoginViewController.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 13.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+Utility.h"
#import "UIView+Colors.h"
#import "TumblrFeedViewController.h"
#import "ConstraintUtility.h"
#import "DataManager.h"
#import "LoginManager.h"
#import "DownloadManager.h"

@interface LoginViewController : UIViewController <DataManagerDelegate>

@property (nonatomic) UITextField* _Nonnull loginTextField;
@property (nonatomic) UIButton* _Nonnull loginButton;
@property (nonatomic) DataManager* _Nonnull dataManager;
@property (nonatomic) LoginManager* _Nonnull loginManager;
@property (nonatomic) DownloadManager* _Nonnull downloadManager;

-(void)setup;
-(void)loginButtonTapped:(UIButton* _Nonnull)sender;

@end
