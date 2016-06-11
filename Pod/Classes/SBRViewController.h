//
//  SBRViewController.h
//  Pods
//
//  Created by Pavel Gurov on 19/02/16.
//
//

#import <UIKit/UIKit.h>
#import <GoogleAnalytics/GAITrackedViewController.h>

@interface SBRViewController : GAITrackedViewController

- (void)methodCalledFromDealloc;

- (void)appBecameActive;
- (void)networkStatusChanged:(NSNotification *)notification;

@property (nonatomic) BOOL hidesNavBar;
@property (nonatomic) BOOL locksInteractivePopGestureRecognizer;

@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *flexibleConstraints;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *constraintsToMake1px;

- (void)backTap;

//------------------------------------------------------------------------------
#pragma mark - Finding storyboard

+ (UIStoryboard *)storyboardWhereThisClassIs;
+ (NSString *)storyboardID;
+ (instancetype)newControllerFromStoryboard;

//------------------------------------------------------------------------------
#pragma mark - Keyboard shit

@property (nonatomic) NSNumber *initialScrollViewBottomOffset;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewToFixBottomInsetIn;
- (void)keyboardWillShow:(NSNotification *)note;
- (void)keyboardWillHide:(NSNotification *)note;

@end
