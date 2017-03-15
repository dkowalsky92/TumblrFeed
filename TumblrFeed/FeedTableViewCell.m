//
//  FeedTableViewCell.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 04/03/2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "FeedTableViewCell.h"

@implementation FeedTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    [self configureCell];
    
    return self;
}

-(void)configureCell {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _topView = [[UIView alloc] initWithFrame:CGRectZero];
    _topView.backgroundColor = [UIView black];
    _topView.translatesAutoresizingMaskIntoConstraints = false;
    [self.contentView addSubview:_topView];
    
    NSLayoutConstraint* topConstraintTopView = [ConstraintUtility constraintTopToLayoutAttribute:NSLayoutAttributeTop :_topView toView: self.contentView withConstant:0];
    NSLayoutConstraint* leftConstraintTopView = [ConstraintUtility constraintLeftToLayoutAttribute:NSLayoutAttributeLeft :_topView toView: self.contentView withConstant:0];
    NSLayoutConstraint* rightConstraintTopView = [ConstraintUtility constraintRightToLayoutAttribute:NSLayoutAttributeRight :_topView toView:self.contentView withConstant:0];
    NSLayoutConstraint* heightConstraintTopView = [ConstraintUtility constraintHeight:_topView withConstant:64];
    
    [self.contentView addConstraints:@[topConstraintTopView, leftConstraintTopView, rightConstraintTopView, heightConstraintTopView]];
    [NSLayoutConstraint activateConstraints:@[topConstraintTopView, leftConstraintTopView, rightConstraintTopView, heightConstraintTopView]];
    
    _userImage = [[UIImageView alloc]initWithFrame:CGRectZero];
    _userImage.backgroundColor = [UIView black];
    _userImage.translatesAutoresizingMaskIntoConstraints = false;
    [_topView addSubview:_userImage];
    
    _userImage.contentMode = UIViewContentModeCenter;
    _userImage.image = [UIImage imageNamed:@"temp_image" inBundle:nil compatibleWithTraitCollection:nil];
     [_userImage sizeToFit];
    
    NSLayoutConstraint* bottomConstraintUserImage = [ConstraintUtility constraintBottomToLayoutAttribute:NSLayoutAttributeBottom :_userImage toView:_topView withConstant:-8];
    NSLayoutConstraint* leftConstraintUserImage = [ConstraintUtility constraintLeftToLayoutAttribute:NSLayoutAttributeLeft :_userImage toView:_topView withConstant:8];
    NSLayoutConstraint* widthConstraintUserImage = [ConstraintUtility constraintWidth:_userImage withConstant:48];
    NSLayoutConstraint* topConstraintUserImage = [ConstraintUtility constraintTopToLayoutAttribute:NSLayoutAttributeTop :_userImage toView:_topView withConstant:8];
    
    [_topView addConstraints:@[bottomConstraintUserImage, leftConstraintUserImage, widthConstraintUserImage, topConstraintUserImage]];
    [NSLayoutConstraint activateConstraints:@[bottomConstraintUserImage, leftConstraintUserImage, widthConstraintUserImage, topConstraintUserImage]];
    
    _nicknameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _nicknameLabel.backgroundColor = [UIColor clearColor];
    _nicknameLabel.textColor = [UIView white];
    _nicknameLabel.text = @"Nickname...";
    _nicknameLabel.translatesAutoresizingMaskIntoConstraints = false;
    [_topView addSubview:_nicknameLabel];
    
    NSLayoutConstraint* bottomConstraintNicknameLabel = [ConstraintUtility constraintBottomToLayoutAttribute:NSLayoutAttributeBottom :_nicknameLabel toView:_topView withConstant:-8];
    NSLayoutConstraint* leftConstraintNicknameLabel = [ConstraintUtility constraintLeftToLayoutAttribute:NSLayoutAttributeRight :_nicknameLabel toView:_userImage withConstant:8];
    NSLayoutConstraint* rightConstraintNicknameLabel = [ConstraintUtility constraintRightToLayoutAttribute:NSLayoutAttributeRight :_nicknameLabel toView:_topView withConstant:-8];
    NSLayoutConstraint* topConstraintNicknameLabel = [ConstraintUtility constraintTopToLayoutAttribute:NSLayoutAttributeTop :_nicknameLabel toView:_topView withConstant:8];
    
    [_topView addConstraints:@[bottomConstraintNicknameLabel, leftConstraintNicknameLabel, rightConstraintNicknameLabel, topConstraintNicknameLabel]];
    [NSLayoutConstraint activateConstraints:@[bottomConstraintNicknameLabel, leftConstraintNicknameLabel, rightConstraintNicknameLabel, topConstraintNicknameLabel]];
    
    _bottomView = [[UIView alloc] initWithFrame:CGRectZero];
    _bottomView.backgroundColor = [UIView black];
    _bottomView.translatesAutoresizingMaskIntoConstraints = false;
    [self.contentView addSubview:_bottomView];
    
    NSLayoutConstraint* bottomConstraintBottomView = [ConstraintUtility constraintBottomToLayoutAttribute:NSLayoutAttributeBottom :_bottomView toView:self.contentView withConstant:0];
    NSLayoutConstraint* leftConstraintBottomView = [ConstraintUtility constraintLeftToLayoutAttribute:NSLayoutAttributeLeft :_bottomView toView:self.contentView withConstant:0];
    NSLayoutConstraint* rightConstraintBottomView = [ConstraintUtility constraintRightToLayoutAttribute:NSLayoutAttributeRight :_bottomView toView:self.contentView withConstant:0];
    NSLayoutConstraint* heightConstraintBottomView = [ConstraintUtility constraintHeight:_bottomView withConstant:64];
    
    [self.contentView addConstraints:@[bottomConstraintBottomView, leftConstraintBottomView, rightConstraintBottomView, heightConstraintBottomView]];
    [NSLayoutConstraint activateConstraints:@[bottomConstraintBottomView, leftConstraintBottomView, rightConstraintBottomView, heightConstraintBottomView]];
    
    _noteLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _noteLabel.backgroundColor = [UIColor clearColor];
    _noteLabel.textColor = [UIColor whiteColor];
    _noteLabel.text = @"Just some random note below...";
    _noteLabel.translatesAutoresizingMaskIntoConstraints = false;
    [_bottomView addSubview:_noteLabel];
    
    NSLayoutConstraint* bottomConstraintNoteLabel = [ConstraintUtility constraintBottomToLayoutAttribute:NSLayoutAttributeBottom :_noteLabel toView:_bottomView withConstant:-8];
    NSLayoutConstraint* leftConstraintNoteLabel = [ConstraintUtility constraintLeftToLayoutAttribute:NSLayoutAttributeLeft :_noteLabel toView:_bottomView withConstant:8];
    NSLayoutConstraint* rightConstraintNoteLabel = [ConstraintUtility constraintRightToLayoutAttribute:NSLayoutAttributeRight :_noteLabel toView:_bottomView withConstant:-8];
    NSLayoutConstraint* topConstraintNoteLabel = [ConstraintUtility constraintTopToLayoutAttribute:NSLayoutAttributeTop :_noteLabel toView:_bottomView withConstant:8];
    
    [self.contentView addConstraints:@[bottomConstraintNoteLabel, leftConstraintNoteLabel, rightConstraintNoteLabel, topConstraintNoteLabel]];
    [NSLayoutConstraint activateConstraints:@[bottomConstraintNoteLabel, leftConstraintNoteLabel, rightConstraintNoteLabel, topConstraintNoteLabel]];
    
    _postContentView = [[UIView alloc] initWithFrame:CGRectZero];
    _postContentView.backgroundColor = [UIView purple];
    _postContentView.translatesAutoresizingMaskIntoConstraints = false;
    [self.contentView addSubview:_postContentView];
    
    NSLayoutConstraint* bottomConstraintPostContentView = [ConstraintUtility constraintBottomToLayoutAttribute:NSLayoutAttributeTop :_postContentView toView:_bottomView withConstant:0];
    NSLayoutConstraint* leftConstraintPostContentView= [ConstraintUtility constraintLeftToLayoutAttribute:NSLayoutAttributeLeft :_postContentView toView:self.contentView withConstant:0];
    NSLayoutConstraint* rightConstraintPostContentView = [ConstraintUtility constraintRightToLayoutAttribute:NSLayoutAttributeRight :_postContentView toView:self.contentView withConstant:0];
    NSLayoutConstraint* topConstraintPostContentView = [ConstraintUtility constraintTopToLayoutAttribute:NSLayoutAttributeBottom :_postContentView toView:_topView withConstant:0];
    
    [self.contentView addConstraints:@[bottomConstraintPostContentView, leftConstraintPostContentView, rightConstraintPostContentView, topConstraintPostContentView]];
    [NSLayoutConstraint activateConstraints:@[bottomConstraintPostContentView, leftConstraintPostContentView, rightConstraintPostContentView, topConstraintPostContentView]];  
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
