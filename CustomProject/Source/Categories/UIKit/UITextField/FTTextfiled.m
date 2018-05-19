//
//  FTTextfiled.m
//  InvestApp
//
//  Created by 方涛 on 2016/11/21.
//  Copyright © 2016年 Puyue. All rights reserved.
//

#import "FTTextfiled.h"

@implementation FTTextfiled

- (void)drawRect:(CGRect)rect
{
    [self setFont:[UIFont systemFontOfSize:13]];
    self.tintColor = [UIColor blackColor];
    self.textColor = [UIColor blackColor];
    self.clearButtonMode = UITextFieldViewModeAlways;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.backgroundColor = [UIColor whiteColor];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5));
}
/**
 自定义光标
 */
- (CGRect)caretRectForPosition:(UITextPosition *)position
{    CGRect originalRect = [super caretRectForPosition:position];
    originalRect.size.height = self.font.lineHeight + 2;
    originalRect.size.width = 1;
    return originalRect;
}
//显示文本的位置
-(CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x +30, bounds.origin.y, bounds.size.width -10, bounds.size.height);
    
    return inset;
    
}
//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    //return CGRectInset( bounds, 10 , 0 );
    
    CGRect inset = CGRectMake(bounds.origin.x +30, bounds.origin.y, bounds.size.width -10, bounds.size.height);
    return inset;
}
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    
    //return CGRectInset(bounds, 20, 0);
    CGRect inset = CGRectMake(bounds.origin.x+30, bounds.origin.y, bounds.size.width -10, bounds.size.height);//更好理解些
    return inset;
}

- (void)setTriangleColor:(UIColor*)color
{
    self.bgColor = color;
    [self setNeedsDisplay];
}

@end
