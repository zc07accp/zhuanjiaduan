//
//  UILabel+Style.h
//  InvestApp
//
//  Created by ZhangJiuCheng on 16/3/17.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (style)
/**
 *  获取一个新创建的label
 */
+(UILabel*)labelWithSize:(UIFont*)font
               withColor:(UIColor*)color
                withText:(NSString*)text;

/**
 *  获取一个新创建的label,frame
 */
+ (UILabel*)labelWithframe:(CGRect )frame withSize:(NSInteger)size
                withColor:(UIColor*)color
                 withText:(NSString*)text ;
@end
