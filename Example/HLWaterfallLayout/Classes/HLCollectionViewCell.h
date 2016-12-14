//
//  HLCollectionViewCell.h
//  HLWaterfallLayout
//
//  Created by henvy on 14/12/2016.
//  Copyright © 2016 henvy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HLCollectionViewCell;

@protocol HLCollectionViewCellDelegate <NSObject>
-(void)deleteCellAtIndexpath:(NSIndexPath *)indexPath cellView:(HLCollectionViewCell *)cell;
-(void)showAllDeleteBtn;
-(void)hideAllDeleteBtn;
@end

@interface HLCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic,strong)NSIndexPath *indexPath;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (nonatomic,assign) id<HLCollectionViewCellDelegate>delegate;
@end
