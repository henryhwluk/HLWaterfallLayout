//
//  HLCollectionViewCell.m
//  HLWaterfallLayout
//
//  Created by henvy on 14/12/2016.
//  Copyright © 2016 henvy. All rights reserved.
//

#import "HLCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "HLAnimation.h"
@interface HLCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation HLCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    _deleteBtn.hidden = YES;
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longClick:)];
    [self addGestureRecognizer:lpgr];
}
- (void)longClick:(UILongPressGestureRecognizer *)lpgr
{
    [self.delegate showAllDeleteBtn];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if ([anim valueForKey:@"animType"] ){
        [self.delegate deleteCellAtIndexpath:_indexPath cellView:self];
    }
}
- (IBAction)deleteBtnAction:(id)sender {
    [HLAnimation toMiniAnimation:self];
    
}
- (void)setImageURL:(NSURL *)imageURL {
    _imageURL = imageURL;
    [self.imageView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
}
@end
