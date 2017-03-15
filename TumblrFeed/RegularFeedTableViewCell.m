//
//  RegularFeedTableViewCell.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 15.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "RegularFeedTableViewCell.h"

@implementation RegularFeedTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    return self;
}

-(void)configureCell {
    [super configureCell];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.backgroundColor = [UIView black];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    _titleLabel.text = @"Regular title";
    _titleLabel.numberOfLines = 0;
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.adjustsFontSizeToFitWidth = true;
    _titleLabel.textColor = [UIView white];
    _titleLabel.font = [UIFont systemFontOfSize:28];
    [self.postContentView addSubview:_titleLabel];
    
    NSLayoutConstraint* topConstraintTitleLabel = [ConstraintUtility constraintTopToLayoutAttribute:NSLayoutAttributeTop :_titleLabel toView:self.postContentView withConstant:2];
    NSLayoutConstraint* heightConstraintTitleLabel = [ConstraintUtility constraintHeight:_titleLabel withConstant:44];
    NSLayoutConstraint* leftConstraintTitleLabel= [ConstraintUtility constraintLeftToLayoutAttribute:NSLayoutAttributeLeft :_titleLabel toView:self.postContentView withConstant:0];
    NSLayoutConstraint* rightConstraintTitleLabel = [ConstraintUtility constraintRightToLayoutAttribute:NSLayoutAttributeRight :_titleLabel toView:self.postContentView withConstant:0];
    
    
    [self.postContentView addConstraints:@[topConstraintTitleLabel, heightConstraintTitleLabel, leftConstraintTitleLabel, rightConstraintTitleLabel]];
    [NSLayoutConstraint activateConstraints:@[topConstraintTitleLabel, heightConstraintTitleLabel, leftConstraintTitleLabel, rightConstraintTitleLabel]];
    
    _bodyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _bodyLabel.backgroundColor = [UIColor clearColor];
    _bodyLabel.translatesAutoresizingMaskIntoConstraints = false;
    _bodyLabel.adjustsFontSizeToFitWidth = true;
    _bodyLabel.numberOfLines = 0;
    _bodyLabel.text = @"Regular body";
    _bodyLabel.textAlignment = NSTextAlignmentLeft;
    _bodyLabel.textColor = [UIView white];
    _bodyLabel.font = [UIFont systemFontOfSize:24];
    [self.postContentView addSubview:_bodyLabel];
    
    NSLayoutConstraint* topConstraintBodyLabel = [ConstraintUtility constraintTopToLayoutAttribute:NSLayoutAttributeBottom :_bodyLabel toView:_titleLabel withConstant:8];
    NSLayoutConstraint* bottomConstraintBodyLabel = [ConstraintUtility constraintBottomToLayoutAttribute:NSLayoutAttributeBottom :_bodyLabel toView:self.postContentView withConstant:-8];
    NSLayoutConstraint* leftConstraintBodyLabel= [ConstraintUtility constraintLeftToLayoutAttribute:NSLayoutAttributeLeft :_bodyLabel toView:self.postContentView withConstant:8];
    NSLayoutConstraint* rightConstraintBodyLabel = [ConstraintUtility constraintRightToLayoutAttribute:NSLayoutAttributeRight :_bodyLabel toView:self.postContentView withConstant:-8];
    
    
    [self.postContentView addConstraints:@[topConstraintBodyLabel, bottomConstraintBodyLabel, leftConstraintBodyLabel, rightConstraintBodyLabel]];
    [NSLayoutConstraint activateConstraints:@[topConstraintBodyLabel, bottomConstraintBodyLabel, leftConstraintBodyLabel, rightConstraintBodyLabel]];
}

@end
