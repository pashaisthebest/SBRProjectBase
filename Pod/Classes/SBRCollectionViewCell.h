//
//  SBRCollectionViewCell.h
//  Pods
//
//  Created by Pavel Gurov on 09/03/16.
//
//

#import <UIKit/UIKit.h>

@interface SBRCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) NSIndexPath *indexPathCellIsOn;
+ (NSString *)cellIdentifier;

@end
