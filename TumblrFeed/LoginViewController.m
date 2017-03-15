//
//  LoginViewController.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 13.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

-(void)loadView {
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [view setBackgroundColor: [UIColor whiteColor]];
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self.navigationController setNavigationBarHidden:true];
}

-(void)viewWillAppear:(BOOL)animated {
    _dataManager.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated {
    _dataManager.delegate = nil;
}

-(void)setup {
    
    self.view.backgroundColor = [UIView black];
    
    _loginTextField = [[UITextField alloc]initWithFrame:CGRectZero];
    _loginTextField.backgroundColor = [UIView black];
    _loginTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Login..." attributes:@{NSForegroundColorAttributeName: [UIView purple]}];
    _loginTextField.textColor = [UIView white];
    _loginTextField.borderStyle = UITextBorderStyleNone;
    _loginTextField.textAlignment = NSTextAlignmentCenter;
    _loginTextField.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:_loginTextField];
    
    NSLayoutConstraint* centerHorizontalTextFieldConstraint = [ConstraintUtility constraintHorizontally:_loginTextField toView:self.view];
    NSLayoutConstraint* centerVerticalTextFieldConstraint = [ConstraintUtility constraintVertically:_loginTextField toView:self.view];
    NSLayoutConstraint* widthTextFieldConstraint = [ConstraintUtility constraintWidth:_loginTextField withConstant:self.view.frame.size.width/2];
    NSLayoutConstraint* heightTextFieldConstraint =  [ConstraintUtility constraintHeight:_loginTextField withConstant:64];
    
    [NSLayoutConstraint activateConstraints:@[centerHorizontalTextFieldConstraint, centerVerticalTextFieldConstraint, widthTextFieldConstraint, heightTextFieldConstraint]];
    
    _loginButton = [[UIButton alloc]initWithFrame:CGRectZero];
    _loginButton.backgroundColor = [UIView black];
    _loginButton.translatesAutoresizingMaskIntoConstraints = false;
    [_loginButton addTarget:self action:@selector(loginButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [_loginButton setTintColor:[UIView white]];
    [self.view addSubview:_loginButton];
    
    NSLayoutConstraint* topButtonConstraint = [ConstraintUtility constraintTopToLayoutAttribute:NSLayoutAttributeBottom :_loginButton toView:_loginTextField withConstant:44];
    NSLayoutConstraint* centerHorizontalButtonConstraint = [ConstraintUtility constraintHorizontally:_loginButton toView:self.view];
    NSLayoutConstraint* widthButtonConstraint = [ConstraintUtility constraintWidth:_loginButton withConstant:self.view.frame.size.width/2];
    NSLayoutConstraint* heightButtonConstraint =  [ConstraintUtility constraintHeight:_loginButton withConstant:64];
    
    [NSLayoutConstraint activateConstraints:@[topButtonConstraint, centerHorizontalButtonConstraint, widthButtonConstraint, heightButtonConstraint]];
    
    _downloadManager = [DownloadManager shared];
    _loginManager = [LoginManager shared];
    _dataManager = [DataManager shared];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:true];
}

-(void)loginButtonTapped:(UIButton* _Nonnull)sender {
    [_loginManager loginWithUsername:_loginTextField.text];
}

// MARK: - DataManager implementation
-(void)didStoreUser:(ManagedUser *)user inContext:(NSManagedObjectContext *)context {
    [_downloadManager fetchDataForUser:user];
    
    TumblrFeedViewController* tumblrFeedController = [[TumblrFeedViewController alloc]init];
    [self.navigationController pushViewController:tumblrFeedController animated:true];
}

-(void)didFailStoringUser:(User* _Nonnull)user inContext:(NSManagedObjectContext* _Nonnull)context withError:(NSError* _Nullable)error {
    [self presentAlertViewControllerWithTitle:@"Sorry" message:error.localizedDescription andButton:@"OK" withAction:nil];
}

@end
