//
//  LinkFeedTableViewCell.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 15.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "LinkFeedTableViewCell.h"

@implementation LinkFeedTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    return self;
}

-(void)configureCell {
    [super configureCell];
    
    _linkButton = [[UIButton alloc] initWithFrame:CGRectZero];
    _linkButton.layer.cornerRadius = 10;
    _linkButton.layer.masksToBounds = true;
    _linkButton.backgroundColor = [UIView red];
    _linkButton.translatesAutoresizingMaskIntoConstraints = false;
    _linkButton.tintColor = [UIView white];
    [_linkButton addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    [_linkButton setTitle:@"Link title" forState:UIControlStateNormal];
    
    [self.postContentView addSubview:_linkButton];
    
    NSLayoutConstraint* topConstraintLinkButton = [ConstraintUtility constraintTopToLayoutAttribute:NSLayoutAttributeTop :_linkButton toView:self.postContentView withConstant:4];
    NSLayoutConstraint* bottomConstraintLinkButton = [ConstraintUtility constraintBottomToLayoutAttribute:NSLayoutAttributeBottom :_linkButton toView:self.postContentView withConstant:-4];
    NSLayoutConstraint* leftConstraintLinkButton = [ConstraintUtility constraintLeftToLayoutAttribute:NSLayoutAttributeLeft :_linkButton toView:self.postContentView withConstant:8];
    NSLayoutConstraint* rightConstraintLinkButton = [ConstraintUtility constraintRightToLayoutAttribute:NSLayoutAttributeRight :_linkButton toView:self.postContentView withConstant:-8];
    
    
    [self.postContentView addConstraints:@[topConstraintLinkButton, bottomConstraintLinkButton, leftConstraintLinkButton, rightConstraintLinkButton]];
    [NSLayoutConstraint activateConstraints:@[topConstraintLinkButton, bottomConstraintLinkButton, leftConstraintLinkButton, rightConstraintLinkButton]];
    
}

-(void)openLink:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:_linkUrl options:@{} completionHandler:^(BOOL success) {
        
    }];
}

@end
