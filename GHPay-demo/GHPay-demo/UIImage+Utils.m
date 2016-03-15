//
//  UIImage+Utils.m
//  GHPay-demo
//
//  Created by shen_gh on 16/3/15.
//  Copyright © 2016年 com.joinup(Beijing). All rights reserved.
//

#import "UIImage+Utils.h"

@implementation UIImage (Utils)

+ (UIImage *)imageFormColor:(UIColor *)color frame:(CGRect)frame{
    CGRect rect=CGRectMake(0, 0, frame.size.width, frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
