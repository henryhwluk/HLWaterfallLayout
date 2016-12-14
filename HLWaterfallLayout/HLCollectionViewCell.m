//
//  HLCollectionViewCell.m
//  HLWaterfallLayout
//
//  Created by henvy on 14/12/2016.
//  Copyright © 2016 henvy. All rights reserved.
//

#import "HLCollectionViewCell.h"
@interface HLCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation HLCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setImageURL:(NSURL *)imageURL {
    _imageURL = imageURL;
    //[self.imageView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"placeholder"]];
}
@end
