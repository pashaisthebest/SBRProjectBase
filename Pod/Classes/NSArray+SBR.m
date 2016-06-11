//
//  NSArray+CCAdditions.m
//  CarCar
//
//  Created by Pavel Gurov on 12/05/16.
//  Copyright © 2016 Superbright. All rights reserved.
//

#import "NSArray+SBR.h"
#import "NSDictionary+SBR.h"

@implementation NSArray (SBR)

+ (NSArray *)cleanArrayOfNulls:(NSArray *)array {
    NSMutableArray *arrayToReturn = [NSMutableArray array];
    
    for (id someItem in array) {
        
        if (someItem && ![someItem isKindOfClass:[NSNull class]] && ![someItem isEqual:[NSNull null]]) {
            
            if ([someItem isKindOfClass:[NSArray class]]) {
                NSArray *cleanArray = [self cleanArrayOfNulls:someItem];
                [arrayToReturn addObject:[cleanArray copy]];
            }
            else if ([someItem isKindOfClass:[NSDictionary class]]) {
                NSDictionary *cleanInnerDict = [NSDictionary cleanDictionaryOfNulls:someItem];
                [arrayToReturn addObject:[cleanInnerDict copy]];
            }
            else {
                [arrayToReturn addObject:someItem];
            }
        }
    }
    
    return arrayToReturn;
}

@end
