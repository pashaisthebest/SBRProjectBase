//
//  NSDictionary+CarCar.h
//  CarCar
//
//  Created by Pavel Gurov on 14/03/16.
//  Copyright © 2016 Superbright. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SBR)

- (NSString *)jsonStringWithPrettyPrint:(BOOL)prettyPrint;
+ (NSDictionary *)cleanDictionaryOfNulls:(NSDictionary *)dictionary;

@end
