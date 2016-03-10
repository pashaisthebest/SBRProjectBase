//
//  SBRTableViewCell.h
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

#import <UIKit/UIKit.h>

@interface SBRTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *constraintsToMake1px;
@property (strong, nonatomic) NSIndexPath *indexPathCellIsOn;

+ (NSString *)cellIdentifier;
+ (CGFloat)cellHeight;

@end
