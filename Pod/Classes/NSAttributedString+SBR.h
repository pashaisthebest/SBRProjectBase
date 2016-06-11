//
//  NSAttributedString+SBRExtensions.h
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (SBR)

+ (NSAttributedString *)attributedStringFromString:(NSString *)string
                                          withFont:(UIFont *)font
                                             color:(UIColor *)color
                                        lineHeight:(CGFloat)lineHeight;

+ (NSAttributedString *)attributedStringFromString:(NSString *)string
                                          withFont:(UIFont *)font
                                             color:(UIColor *)color
                                        lineHeight:(CGFloat)lineHeight
                                     lineBreakMode:(NSLineBreakMode)mode;

@end
