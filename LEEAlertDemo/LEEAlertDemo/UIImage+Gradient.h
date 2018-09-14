//
//  UIImage+Gradient.h
//  LEEAlertDemo
//
//  Created by lvjunhang on 2018/6/5.
//  Copyright © 2018年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GradientType) {
    GradientTypeTopToBottom,
    GradientTypeLeftToRight,
    GradientTypeLeftTopToRightBottom,
    GradientTypeLeftBottomToRightTop
};


@interface UIImage (Gradient)
/**
 *  根据给定的颜色，生成渐变色的图片
 *  @param imageSize        要生成的图片的大小
 *  @param gradientType     渐变色的类型
 *  @param gradientColorArray         渐变颜色的数组
 *  @param percentArray          渐变颜色的占比数组
 */
+ (UIImage *)gradientImageWithSize:(CGSize)imageSize gradientType:(GradientType)gradientType colors:(NSArray *)gradientColorArray percentage:(NSArray *)percentArray;
@end
