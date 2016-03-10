//
//  SBRNavigationController.h
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

//  This controller is needed for 3 things
//  1. It allows to use the 'swipe back' gesture even when you add a custom back button (by default this does not work).
//  2. It allows to block this gesture for certain controllers in the navigation stack.
//  3. It takes preferredStatusBarStyle from the top view controller

#import <UIKit/UIKit.h>

@interface SBRNavigationController : UINavigationController

@end
