//
//  NSAttributedString+SBRExtensions.m
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

#import "NSAttributedString+SBRExtensions.h"

@implementation NSAttributedString (SBRExtensions)

+ (NSAttributedString *)attributedStringFromString:(NSString *)string
                                          withFont:(UIFont *)font
                                             color:(UIColor *)color
                                        lineHeight:(CGFloat)lineHeight
{
    return [self attributedStringFromString:string withFont:font color:color lineHeight:lineHeight lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)attributedStringFromString:(NSString *)string
                                          withFont:(UIFont *)font
                                             color:(UIColor *)color
                                        lineHeight:(CGFloat)lineHeight
                                     lineBreakMode:(NSLineBreakMode)mode
{
    if (!string) {
        return nil;
    }
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 0.;
    paragraphStyle.minimumLineHeight = lineHeight;
    paragraphStyle.maximumLineHeight = lineHeight;
    paragraphStyle.lineBreakMode = mode;
    
    NSDictionary *attributes = @{ NSFontAttributeName:font,
                                  NSForegroundColorAttributeName: color? color:[UIColor blackColor],
                                  NSParagraphStyleAttributeName:paragraphStyle
                                  };
    if (string) {
        return [[NSMutableAttributedString alloc] initWithString:string attributes:attributes];
    }
    return nil;
}

@end
