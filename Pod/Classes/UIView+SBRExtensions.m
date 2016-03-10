//
//  UIView+SBRExtensions.m
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

#import "UIView+SBRExtensions.h"

@implementation UIView (SBRExtensions)

+ (NSString *)nibName {
    return [NSString stringWithFormat:@"%@", [self class]];
}

+ (id)loadFromNib {
    id view = [[[NSBundle mainBundle] loadNibNamed:[NSString stringWithFormat:@"%@", [self class]] owner:nil options:nil] objectAtIndex:0];
    return view;
}

+ (NSString *)reuseIdentifier {
    return [self nibName];
}

- (void)showFrameWithColor:(UIColor *)color {
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = 1;
}

@end
