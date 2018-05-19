//
//  UIImage+Merge.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Merge)
+ (UIImage*)mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;


/*
 * 根据文字生成水印图片
 * rect 是相对图片大小的位置
 */
+ (UIImage *)imageWithWaterMarkImage:(NSString *)imageName text:(NSString *)str textRect:(CGRect)rect;
@end
