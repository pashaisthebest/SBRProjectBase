//
//  SBRNavigationController.m
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

#import "SBRNavigationController.h"
#import <SBRViewController.h>

@interface SBRNavigationController () <UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation SBRNavigationController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    __weak SBRNavigationController *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [self.topViewController preferredStatusBarStyle];
}

#pragma mark UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate {
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)] && self.viewControllers.count>1) {
        self.interactivePopGestureRecognizer.enabled = YES;
    } else {
        self.interactivePopGestureRecognizer.enabled = NO;
        [self.navigationBar setNeedsLayout];
    }
    if (self.onDidShowController) {
        self.onDidShowController(viewController);
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([viewController isKindOfClass:[SBRViewController class]] && [(SBRViewController *)viewController hidesNavBar]) {
        [self setNavigationBarHidden:YES animated:animated];
    } else {
        [self setNavigationBarHidden:NO animated:animated];
    }
    if (self.onWillShowController) {
        self.onWillShowController(viewController);
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([self.topViewController isKindOfClass:[SBRViewController class]] &&
        [(SBRViewController *)self.topViewController locksInteractivePopGestureRecognizer]) {
        return NO;
    } else if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)] && self.viewControllers.count>1) {
        return YES;
    } else {
        [self.navigationBar setNeedsLayout];
        return NO;
    }
}

@end
