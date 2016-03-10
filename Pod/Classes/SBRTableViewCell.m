//
//  SBRTableViewCell.m
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

#import "SBRTableViewCell.h"
#import "UIView+SBRExtensions.h"

@implementation SBRTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    for (NSLayoutConstraint *constraint in self.constraintsToMake1px) {
        constraint.constant = 1.0/[UIScreen mainScreen].scale;
    }
}

+ (NSString *)cellIdentifier {
    return [self nibName];
}

+ (CGFloat)cellHeight {
    NSLog(@"WARNING: cellHeight returns 0 in SBRTableViewCell");
    return 0;
}

@end
