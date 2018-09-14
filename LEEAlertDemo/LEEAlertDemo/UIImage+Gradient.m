//
//  UIImage+Gradient.m
//  LEEAlertDemo
//
//  Created by lvjunhang on 2018/6/5.
//  Copyright © 2018年 lee. All rights reserved.
//

#import "UIImage+Gradient.h"

@implementation UIImage (Gradient)
+ (UIImage *)gradientImageWithSize:(CGSize)imageSize gradientType:(GradientType)gradientType colors:(NSArray *)gradientColorArray percentage:(NSArray *)percentArray {
    
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in gradientColorArray) {
        [ar addObject:(id)c.CGColor];
    }
    
    CGFloat locations[5];
    for (int i = 0; i < percentArray.count; i++) {
        locations[i] = [percentArray[i] floatValue];
    }
    
    UIGraphicsBeginImageContextWithOptions(imageSize, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[gradientColorArray lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, locations);
    CGPoint start;
    CGPoint end;
    
    switch (gradientType) {
        case GradientTypeTopToBottom:
            start = CGPointMake(imageSize.width/2, 0.0);
            end = CGPointMake(imageSize.width/2, imageSize.height);
            break;
        case GradientTypeLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imageSize.width, 0.0);
            break;
        case GradientTypeLeftTopToRightBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imageSize.width, imageSize.height);
            break;
        case GradientTypeLeftBottomToRightTop:
            start = CGPointMake(0.0, imageSize.height);
            end = CGPointMake(imageSize.width, 0.0);
            break;
        default:
            break;
    }
    
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    
    return image;
}
@end
