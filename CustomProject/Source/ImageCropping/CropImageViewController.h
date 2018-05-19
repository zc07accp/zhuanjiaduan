//
//  CropImageViewController.h
//  ImageTailor
//
//  Created by yinyu on 15/10/10.
//  Copyright © 2015年 yinyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

typedef void (^BlockValue)(UIImage *image);
@interface CropImageViewController :BaseViewController
@property (strong, nonatomic) UIImage *image;
@property (nonatomic,copy) BlockValue blockValue;

- (void)getValue:(BlockValue)aBlock;
@end
