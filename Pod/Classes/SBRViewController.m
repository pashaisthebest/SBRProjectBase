//
//  SBRViewController.m
//  Pods
//
//  Created by Pavel Gurov on 19/02/16.
//
//

#import "SBRViewController.h"
#import "SBRMacros.h"
#import <Reachability/Reachability.h>

@implementation SBRViewController

#pragma mark -
#pragma mark - NSObject

- (void)dealloc {
    [self methodCalledFromDealloc];
}

- (void)methodCalledFromDealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -
#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.screenName = [NSString stringWithFormat:@"%@", [self class]];
    
    SIGNUP_FOR_NOTIFICATION(UIKeyboardWillShowNotification, @selector(keyboardWillShow:));
    SIGNUP_FOR_NOTIFICATION(UIKeyboardWillHideNotification, @selector(keyboardWillHide:));
    
    SIGNUP_FOR_NOTIFICATION(kReachabilityChangedNotification, @selector(networkStatusChanged:));
    SIGNUP_FOR_NOTIFICATION(UIApplicationDidBecomeActiveNotification, @selector(appBecameActive));
    
    // update flexible constraints
    CGFloat delta = [UIScreen mainScreen].bounds.size.height / IPHONE5_SCREEN_HEIGHT;
    for (NSLayoutConstraint *constraint in self.flexibleConstraints) {
        constraint.constant = constraint.constant*delta;
    }
    
    // make 1px constraints truly = 1px
    for (NSLayoutConstraint *constraint in self.constraintsToMake1px) {
        constraint.constant = 1./[UIScreen mainScreen].scale;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIEdgeInsets currentContentInset = self.scrollViewToFixBottomInsetIn.contentInset;
    currentContentInset.bottom = self.initialScrollViewBottomOffset.floatValue;
    self.scrollViewToFixBottomInsetIn.contentInset = currentContentInset;
    
    UIEdgeInsets currentScrollIndicatorInset = self.scrollViewToFixBottomInsetIn.scrollIndicatorInsets;
    currentScrollIndicatorInset.bottom = self.initialScrollViewBottomOffset.floatValue;
    currentScrollIndicatorInset.top = currentContentInset.top;
    self.scrollViewToFixBottomInsetIn.scrollIndicatorInsets = currentScrollIndicatorInset;
}

- (void)appBecameActive {
    
}

#pragma mark -
#pragma mark - User actions

- (void)backTap {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark - Connectivity

- (void)networkStatusChanged:(NSNotification *)notification {
    
}

#pragma mark -
#pragma mark - Finding storyboard

+ (UIStoryboard *)storyboardWhereThisClassIs {
    return nil;
}

+ (NSString *)storyboardID {
    return NSStringFromClass([self class]);
}

+ (instancetype)newControllerFromStoryboard {
    return [[[self class] storyboardWhereThisClassIs] instantiateViewControllerWithIdentifier:[[self class] storyboardID]];
}

#pragma mark -
#pragma mark - Keyboard notifications

- (void)keyboardWillShow:(NSNotification *)note
{
    if (self.scrollViewToFixBottomInsetIn && self.view.window) {
        
        // get keyboard size and loctaion
        CGRect keyboardBounds;
        [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
        NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
        NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
        
        // Need to translate the bounds to account for rotation.
        keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
        
        if (!self.initialScrollViewBottomOffset) {
            self.initialScrollViewBottomOffset = @(self.scrollViewToFixBottomInsetIn.contentInset.bottom);
        }
        
        UIEdgeInsets currentContentInset = self.scrollViewToFixBottomInsetIn.contentInset;
        currentContentInset.bottom = keyboardBounds.size.height + self.initialScrollViewBottomOffset.floatValue;
        self.scrollViewToFixBottomInsetIn.contentInset = currentContentInset;
        
        UIEdgeInsets currentScrollIndicatorInset = self.scrollViewToFixBottomInsetIn.scrollIndicatorInsets;
        currentScrollIndicatorInset.bottom = keyboardBounds.size.height + self.initialScrollViewBottomOffset.floatValue;
        currentScrollIndicatorInset.top = currentContentInset.top;
        self.scrollViewToFixBottomInsetIn.scrollIndicatorInsets = currentScrollIndicatorInset;
        
        // animations settings
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:[duration doubleValue]];
        [UIView setAnimationCurve:[curve intValue]];
        
        [self.view layoutIfNeeded];
        
        // commit animations
        [UIView commitAnimations];
    }
}

- (void)keyboardWillHide:(NSNotification *)note
{
    if (self.scrollViewToFixBottomInsetIn && self.view.window) {
        if (self.initialScrollViewBottomOffset) {
            NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
            NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
            
            UIEdgeInsets currentContentInset = self.scrollViewToFixBottomInsetIn.contentInset;
            currentContentInset.bottom = self.initialScrollViewBottomOffset.floatValue;
            self.scrollViewToFixBottomInsetIn.contentInset = currentContentInset;
            
            UIEdgeInsets currentScrollIndicatorInset = self.scrollViewToFixBottomInsetIn.scrollIndicatorInsets;
            currentScrollIndicatorInset.bottom = self.initialScrollViewBottomOffset.floatValue;
            currentScrollIndicatorInset.top = currentContentInset.top;
            self.scrollViewToFixBottomInsetIn.scrollIndicatorInsets = currentScrollIndicatorInset;
            
            // animations settings
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationBeginsFromCurrentState:YES];
            [UIView setAnimationDuration:[duration doubleValue]];
            [UIView setAnimationCurve:[curve intValue]];
            
            [self.view layoutIfNeeded];
            
            // commit animations
            [UIView commitAnimations];
            
            self.initialScrollViewBottomOffset = nil;
        }
    }
}

@end
