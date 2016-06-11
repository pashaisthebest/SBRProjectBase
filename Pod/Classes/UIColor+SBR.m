//
//  UIColor+CCAdditions.m
//  CarCar
//
//  Created by Pavel Gurov on 21/03/16.
//  Copyright © 2016 Superbright. All rights reserved.
//

#import "UIColor+SBR.h"

@implementation UIColor (SBR)

- (UIColor *)contrastColor {
    
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    red = red * 255;
    green = green * 255;
    blue = blue * 255;
    
    // Counting the perceptive luminance - human eye favors green color...
    double a = 1 - ( 0.299 * red + 0.587 * green + 0.114 * blue)/255;
    
    if (a < 0.5) {
        return [UIColor blackColor];
    } else {
        return [UIColor whiteColor];
    }
}

@end
