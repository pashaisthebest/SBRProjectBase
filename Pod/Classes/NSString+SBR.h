//
//  NSString+SBRExtensions.h
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

#import <Foundation/Foundation.h>

@interface NSString (SBR)

- (BOOL)isValid;
- (BOOL)isValidEmail;
- (NSString *)normilizedPhoneString;
- (NSString *)capitilizedFirstLetterString;
+ (NSString *)UUIDstring;
- (NSDictionary *)jsonDict;

@end
