//
//  FTLabel.h
//  CustomProject
//
//  Created by 方涛 on 2018/1/10.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTLabel : UILabel
// 用来决定上下左右内边距，也可以提供一个借口供外部修改，在这里就先固定写死
@property (assign, nonatomic) UIEdgeInsets edgeInsets;
/**
 *  获取一个新创建的label
 */
+(FTLabel*)labelWithSize:(NSInteger)font
               withColor:(UIColor*)color
                withText:(NSString*)text;

/**
 *  获取一个新创建的label,frame
 */
+ (FTLabel*)labelWithframe:(CGRect )frame withSize:(NSInteger)size
                 withColor:(UIColor*)color
                  withText:(NSString*)text ;

@end
