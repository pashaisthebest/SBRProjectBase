//
//  NSMutableDictionary+SBRExtensions.m
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

#import "NSMutableDictionary+SBRExtensions.h"

@implementation NSMutableDictionary (SBRExtensions)

- (void)safeSetObject:(id)object forKey:(id)key {
    if (object && key) {
        [self setObject:object forKey:key];
    }
}

@end
