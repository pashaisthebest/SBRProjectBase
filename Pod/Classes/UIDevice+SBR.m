#import "UIDevice+SBR.h"
#import "NSDictionary+SBR.h"
#import "UIDevice+Hardware.h"

@implementation UIDevice (SBR)

+ (NSDictionary *)deviceSpecsDictionary {
    NSMutableDictionary *specs = [NSMutableDictionary dictionary];
    NSString *deviceDescription = [[UIDevice currentDevice] hardwareSimpleDescription];
    NSString *osVersion = [[UIDevice currentDevice] systemVersion];
    NSString *resolutionString = [NSString stringWithFormat:@"%i x %i", (int)([UIScreen mainScreen].bounds.size.width * [UIScreen mainScreen].scale), (int)([UIScreen mainScreen].bounds.size.height * [UIScreen mainScreen].scale)];
    
    if (deviceDescription) {
        [specs setObject:deviceDescription forKey:@"device"];
    }
    if (osVersion) {
        [specs setObject:osVersion forKey:@"os"];
    }
    if (resolutionString) {
        [specs setObject:resolutionString forKey:@"screen_resolution"];
    }
    specs[@"app_version"] = [NSString stringWithFormat:@"%@.%@", [UIDevice applicationVersion], [UIDevice buildVersion]];
    return specs;
}

+ (NSString *)applicationVersion {
    return [NSString stringWithFormat:@"%@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
}

+ (NSString *)buildVersion {
    return [NSString stringWithFormat:@"%@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]];
}

+ (NSString *)deviceSpecsJSONString {
    return [[self deviceSpecsDictionary] jsonStringWithPrettyPrint:false];
}

@end
