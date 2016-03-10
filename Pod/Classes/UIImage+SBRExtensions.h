//
//  UIImage+SBRExtensions.h
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (SBRExtensions)

- (UIImage *)fixOrientation;
+ (UIImage*)imageWithImage:(UIImage*)image scaledTo:(CGFloat)sideSize;
+ (UIImage *)tintImage:(UIImage *)image withColor:(UIColor *)color;

@end
