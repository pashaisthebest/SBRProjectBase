//
//  NSObject+SBRAdditions.m
//  CarCar
//
//  Created by Pavel Gurov on 23/03/16.
//  Copyright © 2016 Superbright. All rights reserved.
//

#import "NSObject+SBR.h"

@implementation NSObject (SBR)

- (void)performBlock:(void (^)(void))block
          afterDelay:(NSTimeInterval)delay
{
    block = [block copy];
    [self performSelector:@selector(fireBlockAfterDelay:)
               withObject:block
               afterDelay:delay];
}

- (void)fireBlockAfterDelay:(void (^)(void))block {
    block();
}

@end
