//
//  HLImages.h
//  HLWaterfallLayout
//
//  Created by henvy on 14/12/2016.
//  Copyright © 2016 henvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HLImages : NSObject
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, assign) CGFloat imageW;
@property (nonatomic, assign) CGFloat imageH;

+ (instancetype)imageWithImageDic:(NSDictionary *)imageDic;
@end
