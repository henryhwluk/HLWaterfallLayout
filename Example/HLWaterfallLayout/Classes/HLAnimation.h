//
//  HLAnimation.h
//  HLWaterfallLayout
//
//  Created by henvy on 13/09/2016.
//  Copyright © 2016 henvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HLAnimation : NSObject

+(void)vibrateAnimation:(UIView *)AniView;

+ (void)fadeAnimation:(UIView *)AniView;

+ (void)rotateAnimation:(UIView *)AniView;

+ (void)suckEffectAnimation:(UIView *)AniView;

+ (void)pushAnimation:(UIView *)AniView;

+ (void)rippleEffectAnimation:(UIView *)AniView;

+ (void)cubeEffectAnimation:(UIView *)AniView;

+ (void)oglFlipAnimation:(UIView *)AniView;

+ (void)toMiniAnimation:(UIView *)AniView;
@end
