//
//  NSMutableArray+SBRAdditions.h
//  CarCar
//
//  Created by Pavel Gurov on 07/04/16.
//  Copyright © 2016 Superbright. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (SBR)
- (void)safeAddObject:(id)object;
- (void)shuffle;
@end
