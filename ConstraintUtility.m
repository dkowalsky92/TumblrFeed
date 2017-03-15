//
//  ConstraintUtility.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 05/03/2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "ConstraintUtility.h"

@implementation ConstraintUtility

+(NSLayoutConstraint*)constraintTopToLayoutAttribute:(NSLayoutAttribute)attribute :(UIView *)constrainingView toView:(UIView *)targetView withConstant:(CGFloat)constant {
    NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:constrainingView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:targetView attribute:attribute multiplier:1.0 constant:constant];
    
    return constraint;
}

+(NSLayoutConstraint*)constraintLeftToLayoutAttribute:(NSLayoutAttribute)attribute :(UIView *)constrainingView toView:(UIView *)targetView withConstant:(CGFloat)constant {
    NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:constrainingView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:targetView attribute:attribute multiplier:1.0 constant:constant];
    
    return constraint;
}

+(NSLayoutConstraint*)constraintRightToLayoutAttribute:(NSLayoutAttribute)attribute :(UIView *)constrainingView toView:(UIView *)targetView withConstant:(CGFloat)constant {
    NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:constrainingView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:targetView attribute:attribute multiplier:1.0 constant:constant];

    
    return constraint;
}

+(NSLayoutConstraint*)constraintBottomToLayoutAttribute:(NSLayoutAttribute)attribute :(UIView *)constrainingView toView:(UIView *)targetView withConstant:(CGFloat)constant {
    NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:constrainingView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:targetView attribute:attribute multiplier:1.0 constant:constant];
    
    return constraint;

}

+(NSLayoutConstraint*)constraintWidth:(UIView* _Nonnull)constrainingView withConstant:(CGFloat)constant {
    NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:constrainingView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:constant];
    
    return constraint;

}

+(NSLayoutConstraint*)constraintHeight:(UIView* _Nonnull)constrainingView withConstant:(CGFloat)constant {
    NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:constrainingView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:constant];
    
    return constraint;
}

+(NSLayoutConstraint*)constraintHorizontally:(UIView *)constrainingView toView:(UIView *)targetView {
    NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:constrainingView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:targetView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    return constraint;
}

+(NSLayoutConstraint*)constraintVertically:(UIView *)constrainingView toView:(UIView *)targetView {
    NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:constrainingView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:targetView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    return constraint;
}

@end
