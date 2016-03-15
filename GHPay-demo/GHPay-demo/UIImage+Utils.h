//
//  UIImage+Utils.h
//  GHPay-demo
//
//  Created by shen_gh on 16/3/15.
//  Copyright © 2016年 com.joinup(Beijing). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utils)

/**
 *  取颜色color背景图片
 *
 *  @param color color
 *  @param frame frame
 *
 *  @return UIImage
 */
+ (UIImage *)imageFormColor:(UIColor *)color frame:(CGRect)frame;

@end
