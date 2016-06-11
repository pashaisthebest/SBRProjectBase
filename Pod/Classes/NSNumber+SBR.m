//
//  NSNumber+CarCar.m
//  CarCar
//
//  Created by Pavel Gurov on 22/03/16.
//  Copyright © 2016 Superbright. All rights reserved.
//

#import "NSNumber+SBR.h"

@implementation NSNumber (SBR)

- (NSInteger)pluralizerIndex {
    return (self.integerValue % 10 == 1 && self.integerValue % 100 != 11) ? 0 : (self.integerValue % 10 >= 2 && self.integerValue % 10 <= 4 && (self.integerValue % 100 < 10 || self.integerValue % 100 >= 20) ? 1 : 2);
}

@end
