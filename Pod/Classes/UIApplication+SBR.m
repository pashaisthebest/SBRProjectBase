//
//  UIApplication+CarCar.m
//  CarCar
//
//  Created by Pavel Gurov on 26/03/16.
//  Copyright © 2016 Superbright. All rights reserved.
//

#import "UIApplication+SBR.h"

@implementation UIApplication (SBR)

- (NSString *)stateString {
    NSDictionary *states = @{@(UIApplicationStateActive): @"active",
                             @(UIApplicationStateInactive): @"inactive",
                             @(UIApplicationStateBackground): @"background"};
    
    return states[@(self.applicationState)];
}

@end
