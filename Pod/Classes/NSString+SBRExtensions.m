//
//  NSString+SBRExtensions.m
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

#import "NSString+SBRExtensions.h"

@implementation NSString (SBRExtensions)

- (BOOL)isValid {
    return (![@"" isEqualToString:self]);
}

- (BOOL)isValidEmail {
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (NSString *)normilizedPhoneString {
    return [[self componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]]componentsJoinedByString:@""];
}

- (NSString *)capitilizedFirstLetterString {
    if (self.length > 0) {
        NSString *firstCapChar = [[self substringToIndex:1] capitalizedString];
        NSString *cappedString = [self stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:firstCapChar];
        return cappedString;
    }
    return nil;
}

+ (NSString *)UUIDstring {
    return [[NSUUID UUID] UUIDString];
}

@end
