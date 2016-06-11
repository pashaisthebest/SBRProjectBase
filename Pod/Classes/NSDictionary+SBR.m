//
//  NSDictionary+CarCar.m
//  CarCar
//
//  Created by Pavel Gurov on 14/03/16.
//  Copyright © 2016 Superbright. All rights reserved.
//

#import "NSDictionary+SBR.h"
#import "NSArray+SBR.h"

@implementation NSDictionary (SBR)

- (NSString *)jsonStringWithPrettyPrint:(BOOL)prettyPrint {

    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:(NSJSONWritingOptions)    (prettyPrint ? NSJSONWritingPrettyPrinted : 0)
                                                         error:&error];
    
    if (!jsonData) {
        NSLog(@"bv_jsonStringWithPrettyPrint: error: %@", error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

+ (NSDictionary *)cleanDictionaryOfNulls:(NSDictionary *)dictionary {
    NSMutableDictionary *cleanDictionary = [NSMutableDictionary dictionary];
    
    NSArray *keys = dictionary.allKeys;
    for (NSString *key in keys) {
        id something = dictionary[key];
        if (something && ![something isKindOfClass:[NSNull class]] && ![something isEqual:[NSNull null]]) {
            
            if ([something isKindOfClass:[NSArray class]]) {
                NSArray *cleanArray = [NSArray cleanArrayOfNulls:something];
                [cleanDictionary setObject:[cleanArray copy] forKey:key];
            }
            else if ([something isKindOfClass:[NSDictionary class]]) {
                NSDictionary *cleanInnerDict = [NSDictionary cleanDictionaryOfNulls:something];
                [cleanDictionary setObject:[cleanInnerDict copy] forKey:key];
            }
            else {
                [cleanDictionary setObject:something forKey:key];
            }
        }
    }
    return cleanDictionary;
}

@end
