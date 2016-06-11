//
//  UIView+SBRExtensions.h
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

#import <UIKit/UIKit.h>

@interface UIView (SBR)

+ (NSString *)nibName;
+ (NSString *)reuseIdentifier;

+ (id)loadFromNib;

- (void)showFrameWithColor:(UIColor *)color;

@end
