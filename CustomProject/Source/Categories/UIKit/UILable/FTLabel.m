//
//  FTLabel.m
//  CustomProject
//
//  Created by 方涛 on 2018/1/10.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "FTLabel.h"

@implementation FTLabel
//下面三个方法用来初始化edgeInsets
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.edgeInsets = UIEdgeInsetsMake(25, 15, 25, 15);
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.edgeInsets = UIEdgeInsetsMake(25, 0, 25, 0);
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.edgeInsets = UIEdgeInsetsMake(25, 0, 25, 0);
}

// 修改绘制文字的区域，edgeInsets增加bounds
-(CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    
    /*
     调用父类该方法
     注意传入的UIEdgeInsetsInsetRect(bounds, self.edgeInsets),bounds是真正的绘图区域
     */
    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds,
                                                                 self.edgeInsets) limitedToNumberOfLines:numberOfLines];
    //根据edgeInsets，修改绘制文字的bounds
    rect.origin.x -= self.edgeInsets.left;
    rect.origin.y -= self.edgeInsets.top;
    rect.size.width += self.edgeInsets.left + self.edgeInsets.right;
    rect.size.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return rect;
}

//绘制文字
- (void)drawTextInRect:(CGRect)rect
{
    //令绘制区域为原始区域，增加的内边距区域不绘制
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}
+ (FTLabel*)labelWithSize:(NSInteger)font
                withColor:(UIColor*)color
                 withText:(NSString*)text
{
    FTLabel *label = [[FTLabel alloc] init];
    label.font = [UIFont systemFontOfSize:font];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = color;
    label.text = text;
    return label;
}

+ (FTLabel*)labelWithframe:(CGRect )frame withSize:(NSInteger)size
                 withColor:(UIColor*)color
                  withText:(NSString*)text
{
    FTLabel *label = [[FTLabel alloc] init];
    label.font = [AppStyleConfiguration appFont:size];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = color;
    label.text = text;
    label.frame=frame;
    return label;
}


@end
