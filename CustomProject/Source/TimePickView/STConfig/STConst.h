//
//  STConst.h
//  STPhotoBrowser
//
//  Created by https://github.com/STShenZhaoliang/STPhotoBrowser.git on 16/1/15.
//  Copyright © 2016年 ST. All rights reserved.
//


/**
 *  1.屏幕尺寸
 */
#define ScreenWidth  CGRectGetWidth([UIScreen mainScreen].bounds)
#define ScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)


/**
 *  4.弱引用
 */
#define STWeakSelf __weak typeof(self) weakSelf = self;
