//
//  UIImageView+Style.m
//  FaceLoan
//
//  Created by mozhu on 16/12/7.
//  Copyright © 2016年 zf. All rights reserved.
//

#import "UIImageView+Style.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView(style)

+(UIImageView *)imageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    
    if (imageName) {
        imageView.image = [UIImage imageNamed:imageName];
    }
    return imageView;
}

+(UIImageView *)imageViewWithFrame:(CGRect)frame URL:(NSString *)url placeholderImage:(NSString *)placeholderImage
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholderImage]];
    return imageView;
    
}


+(UIImageView *)imageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName cornerRadius:(CGFloat)cornerRadius{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    if (imageName) {
        imageView.image = [UIImage imageNamed:imageName];
    }
    imageView.layer.cornerRadius = cornerRadius;
    imageView.layer.masksToBounds = YES;
    return imageView;
}


@end
