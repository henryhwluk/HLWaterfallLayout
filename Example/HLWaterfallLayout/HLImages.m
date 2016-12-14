//
//  HLImages.m
//  HLWaterfallLayout
//
//  Created by henvy on 14/12/2016.
//  Copyright © 2016 henvy. All rights reserved.
//

#import "HLImages.h"

@implementation HLImages
+ (instancetype)imageWithImageDic:(NSDictionary *)imageDic {
    HLImages *image = [[HLImages alloc] init];
    image.imageURL = [NSURL URLWithString:imageDic[@"img"]];
    image.imageW = [imageDic[@"w"] floatValue];
    image.imageH = [imageDic[@"h"] floatValue];
    return image;
}
@end
