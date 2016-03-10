//
//  NSString+SBRExtensions.h
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

#import <Foundation/Foundation.h>

@interface NSString (SBRExtensions)

- (BOOL)isValid;
- (BOOL)isValidEmail;
- (NSString *)normilizedPhoneString;
- (NSString *)capitilizedFirstLetterString;
+ (NSString *)UUIDstring;

@end
