#import <UIKit/UIKit.h>

@interface UIDevice (SBR)

+ (NSString *)applicationVersion;
+ (NSString *)buildVersion;
+ (NSDictionary *)deviceSpecsDictionary;
+ (NSString *)deviceSpecsJSONString;

@end
