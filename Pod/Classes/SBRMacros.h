//
//  SBRMacros.h
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

#ifndef SBRMacros_h
#define SBRMacros_h

#define DIRECTORY_LIBRARY [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject]
#define DEFAULTS [NSUserDefaults standardUserDefaults]
#define DEFAULTS_OBJ(__KEY__) [[NSUserDefaults standardUserDefaults] objectForKey:__KEY__]
#define SIGNUP_FOR_NOTIFICATION(__NAME__,__SELECTOR__) [[NSNotificationCenter defaultCenter] addObserver:self selector:__SELECTOR__ name:__NAME__ object:nil]
#define REMOVE_NOTIFICATION(__NAME__) [[NSNotificationCenter defaultCenter] removeObserver:self name:__NAME__ object:nil]
#define POST_NOTIFICATION(__NAME__) [[NSNotificationCenter defaultCenter] postNotificationName:__NAME__ object:nil userInfo:nil]
#define NSLS(__KEY__) NSLocalizedStringWithDefaultValue(__KEY__, @"Localizable", [NSBundle mainBundle], nil, nil)
#define APPLICATION_VERSION [NSString stringWithFormat:@"%@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]]
#define BUILD_VERSION [NSString stringWithFormat:@"%@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]]

#define SECS_IN_DAY 86400
#define SECS_IN_HOUR 3600
#define SECS_IN_30_MINS 1800

#define IPHONE5_SCREEN_HEIGHT 568.
#define IPHONE5_SCREEN_SCALE 2.

#endif /* SBRMacros_h */
