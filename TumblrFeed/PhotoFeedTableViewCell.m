//
//  PhotoFeedTableViewCell.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 15.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "PhotoFeedTableViewCell.h"

@implementation PhotoFeedTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    return self;
}

-(void)configureCell {
    [super configureCell];
    
    _photoTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    _photoTitle.backgroundColor = [UIView black];
    _photoTitle.translatesAutoresizingMaskIntoConstraints = false;
    _photoTitle.text = @"Regular title";
    _photoTitle.numberOfLines = 0;
    _photoTitle.textAlignment = NSTextAlignmentLeft;
    _photoTitle.adjustsFontSizeToFitWidth = true;
    _photoTitle.textColor = [UIView white];
    _photoTitle.font = [UIFont systemFontOfSize:28];
    [self.postContentView addSubview:_photoTitle];
    
    NSLayoutConstraint* topConstraintTitleLabel = [ConstraintUtility constraintTopToLayoutAttribute:NSLayoutAttributeTop :_photoTitle toView:self.postContentView withConstant:2];
    NSLayoutConstraint* heightConstraintTitleLabel = [ConstraintUtility constraintHeight:_photoTitle withConstant:44];
    NSLayoutConstraint* leftConstraintTitleLabel= [ConstraintUtility constraintLeftToLayoutAttribute:NSLayoutAttributeLeft :_photoTitle toView:self.postContentView withConstant:0];
    NSLayoutConstraint* rightConstraintTitleLabel = [ConstraintUtility constraintRightToLayoutAttribute:NSLayoutAttributeRight :_photoTitle toView:self.postContentView withConstant:0];
    
    
    [self.postContentView addConstraints:@[topConstraintTitleLabel, heightConstraintTitleLabel, leftConstraintTitleLabel, rightConstraintTitleLabel]];
    [NSLayoutConstraint activateConstraints:@[topConstraintTitleLabel, heightConstraintTitleLabel, leftConstraintTitleLabel, rightConstraintTitleLabel]];
    
    _photoImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    _photoImage.backgroundColor = [UIColor clearColor];
    _photoImage.contentMode = UIViewContentModeScaleAspectFit;
    _photoImage.translatesAutoresizingMaskIntoConstraints = false;

    [self.postContentView addSubview:_photoImage];
    
    NSLayoutConstraint* topConstraintPhotoImage = [ConstraintUtility constraintTopToLayoutAttribute:NSLayoutAttributeBottom :_photoImage toView:_photoTitle withConstant:8];
    NSLayoutConstraint* bottomConstraintPhotoImage = [ConstraintUtility constraintBottomToLayoutAttribute:NSLayoutAttributeBottom :_photoImage toView:self.postContentView withConstant:-8];
    NSLayoutConstraint* leftConstraintPhotoImage = [ConstraintUtility constraintLeftToLayoutAttribute:NSLayoutAttributeLeft :_photoImage toView:self.postContentView withConstant:8];
    NSLayoutConstraint* rightConstraintPhotoImage = [ConstraintUtility constraintRightToLayoutAttribute:NSLayoutAttributeRight :_photoImage toView:self.postContentView withConstant:-8];
    
    
    [self.postContentView addConstraints:@[topConstraintPhotoImage, bottomConstraintPhotoImage, leftConstraintPhotoImage, rightConstraintPhotoImage]];
    [NSLayoutConstraint activateConstraints:@[topConstraintPhotoImage, bottomConstraintPhotoImage, leftConstraintPhotoImage, rightConstraintPhotoImage]];
}

@end
