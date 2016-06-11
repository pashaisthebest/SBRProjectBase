//
//  NSObject+SBRAdditions.h
//  CarCar
//
//  Created by Pavel Gurov on 23/03/16.
//  Copyright © 2016 Superbright. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SBR)

- (void)performBlock:(void (^)(void))block
          afterDelay:(NSTimeInterval)delay;

@end
