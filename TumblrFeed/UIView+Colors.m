//
//  UIView+UIView_Colors.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 15.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "UIView+Colors.h"

@implementation UIView (Colors)

+(UIColor *)white {
    return [UIColor colorWithRed:242.0/255.0 green:247.0/255.0 blue:242.0/255.0 alpha:255.0/255.0];
}

+(UIColor *)black {
    return [UIColor colorWithRed:20.0/255.0 green:19.0/255.0 blue:1.0/255.0 alpha:255.0/255.0];
}

+(UIColor *)purple {
    return [UIColor colorWithRed:166.0/255.0 green:177.0/255.0 blue:225.0/255.0 alpha:255.0/255.0];
}

+(UIColor *)gray {
    return [UIColor darkGrayColor];
}

+(UIColor *)red {
    return [UIColor colorWithRed:254.0/255.0 green:117.0/255.0 blue:119.0/255.0 alpha:255.0/255.0];
}

@end
