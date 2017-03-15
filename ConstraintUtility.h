//
//  ConstraintUtility.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 05/03/2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConstraintUtility : NSObject

+(NSLayoutConstraint* _Nonnull)constraintTopToLayoutAttribute:(NSLayoutAttribute)attribute :(UIView* _Nonnull)constrainingView toView:(UIView* _Nonnull)targetView withConstant:(CGFloat)constant;
+(NSLayoutConstraint* _Nonnull)constraintLeftToLayoutAttribute:(NSLayoutAttribute)attribute :(UIView* _Nonnull)constrainingView toView:(UIView* _Nonnull)targetView withConstant:(CGFloat)constant;
+(NSLayoutConstraint* _Nonnull)constraintRightToLayoutAttribute:(NSLayoutAttribute)attribute :(UIView* _Nonnull)constrainingView toView:(UIView* _Nonnull)targetView withConstant:(CGFloat)constant;
+(NSLayoutConstraint* _Nonnull)constraintBottomToLayoutAttribute:(NSLayoutAttribute)attribute :(UIView* _Nonnull)constrainingView toView:(UIView* _Nonnull)targetView withConstant:(CGFloat)constant;
+(NSLayoutConstraint* _Nonnull)constraintWidth:(UIView* _Nonnull)constrainingView withConstant:(CGFloat)constant;
+(NSLayoutConstraint* _Nonnull)constraintHeight:(UIView* _Nonnull)constrainingView withConstant:(CGFloat)constant;
+(NSLayoutConstraint* _Nonnull)constraintHorizontally:(UIView* _Nonnull)constrainingView toView:(UIView* _Nonnull)targetView;
+(NSLayoutConstraint* _Nonnull)constraintVertically:(UIView* _Nonnull)constrainingView toView:(UIView* _Nonnull)targetView;
@end
