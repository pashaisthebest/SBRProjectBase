//
//  NSMutableArray+SBRAdditions.m
//  CarCar
//
//  Created by Pavel Gurov on 07/04/16.
//  Copyright © 2016 Superbright. All rights reserved.
//

#import "NSMutableArray+SBR.h"

@implementation NSMutableArray (SBR)

- (void)safeAddObject:(id)object {
    if (object) {
        [self addObject:object];
    }
}

- (void)shuffle {
    NSUInteger count = [self count];
    if (count < 1) return;
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

@end
