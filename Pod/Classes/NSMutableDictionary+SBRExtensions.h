//
//  NSMutableDictionary+SBRExtensions.h
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (SBRExtensions)

- (void)safeSetObject:(id)object forKey:(id)key;

@end
