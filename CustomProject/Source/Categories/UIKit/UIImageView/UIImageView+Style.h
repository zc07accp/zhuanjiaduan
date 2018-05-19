//
//  UIImageView+Style.h
//  FaceLoan
//
//  Created by mozhu on 16/12/7.
//  Copyright © 2016年 zf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView(style)

/**
 *普通图片
 */
+(UIImageView *)imageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName;

/**
 加载网络图片
 */
+(UIImageView *)imageViewWithFrame:(CGRect)frame URL:(NSString *)url placeholderImage:(NSString *)placeholderImage;

/**
 包含圆角的imageView
 */
+(UIImageView *)imageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName cornerRadius:(CGFloat)cornerRadius;

@end
