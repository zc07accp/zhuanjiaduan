//
//  FTTextFiled.m
//  Encounter
//
//  Created by 方涛 on 2017/2/21.
//  Copyright © 2017年 zf. All rights reserved.
//

#import "FTTextFiled.h"
#import "UITextField+Blocks.h"
#import "UIView+Frame.h"

@interface FTTextFiled()

@end
@implementation FTTextFiled
-(void)loadViews{
   }
-(void)layoutViews{
    
}
//左边文字，右边textfiled
-(void)creatTextFiledWithLeftString:(NSString*)str {
    self.backgroundColor=[UIColor clearColor];
    _lab=[UILabel labelWithSize:[AppStyleConfiguration appFont:14] withColor:[AppStyleConfiguration ColorWithTextWhite] withText:str];
    CGSize size=[MyControl sizeForNoticeTitle:str font:14];
    _tf=[UITextField new];
    [_tf setTintColor:[AppStyleConfiguration ColorWithTextWhite]];
    _tf.textColor=[AppStyleConfiguration ColorWithTextWhite];
    _tf.font=[AppStyleConfiguration appFont:14];
    [self addSubview:_lab];
    [self addSubview:_tf];
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.centerY.equalTo(@0);
        make.height.equalTo(@(GTFixHeightFlaot(30)));
        make.width.equalTo(@(size.width+10));
    }];
    [_tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(size.width+15));
        make.right.equalTo(@0);
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
}
//左边图片，右边textfiled；
-(void)creatTextFiledWithImage:(NSString*)img{
    self.backgroundColor=[UIColor clearColor];
    _tf=[UITextField new];
    [_tf setTintColor:[AppStyleConfiguration ColorWithTextWhite]];
    _tf.textColor=[AppStyleConfiguration ColorWithTextWhite];
    _tf.font=[AppStyleConfiguration appFont:14];
    [self addSubview:_tf];
    _tf.leftViewMode = UITextFieldViewModeAlways;
     UIImageView *imageView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:img]];
    [imageView setWidth:imageView.image.size.width+GTFixWidthFlaot(20)];
    imageView.contentMode = UIViewContentModeCenter;
    self.tf.leftView =imageView;
    [self.tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(@-45);
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
    }];

}
//添加底部线条
-(UIView *)line{
    if (!_line.superview) {
        _line=[UIView new];
        _line.backgroundColor=[AppStyleConfiguration ColorWithMain];
        [self addSubview:_line];
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.right.equalTo(@0);
            make.height.equalTo(@0.5);
            make.bottom.equalTo(@0);
        }];
    }
    return _line;
}
//设置手机号类型
-(void)phone{
    self.tf.keyboardType=UIKeyboardTypeNumberPad;
    [self.tf setShouldChangeCharactersInRangeBlock:^BOOL(UITextField *textField, NSRange range, NSString *string) {
        if (textField.text.length >= 11 && string.length) {
            return NO;
        }else{
            return  [MyControl validateNumber:string];
        }
        return YES;
    }];

}
//设置验证码类型textfiled 带按钮
-(void)checkCode{
    self.codeBtn=[UIButton buttonWithTitle:@"获取验证码" withImageName:nil withBGColor:[UIColor whiteColor] Withlayer:YES];
    self.codeBtn.titleLabel.font=[AppStyleConfiguration FontWith12];
    self.codeBtn.layer.cornerRadius=GTFixHeightFlaot(5);
    [self addSubview:self.codeBtn];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.right.equalTo(@(GTFixWidthFlaot(-25)));
        make.height.equalTo(@(GTFixHeightFlaot(25)));
        make.width.equalTo(@(GTFixWidthFlaot(80)));
    }];
    self.tf.keyboardType=UIKeyboardTypeNumberPad;
    
//    以前清楚按钮。
//    [self.tf setShouldChangeCharactersInRangeBlock:^BOOL(UITextField *textField, NSRange range, NSString *string) {
//        if (textField.text.length >= 6 && string.length) {
//            return NO;
//        }else{
//            return  [MyControl validateNumber:string];
//        }
//        return YES;
//    }];
    
}
//密码类型textfiled 带按钮
-(void)pwdTextFiledWithBtnOpenImg:(NSString*)openImg CloseImg:(NSString*)closeImg{
    self.tf.keyboardType=UIKeyboardTypeASCIICapable;
    self.tf.secureTextEntry=YES;
    self.eyeBtn=[UIButton buttonWithTitle:nil withImageName:closeImg withBGColor:[UIColor clearColor] Withlayer:YES];
    [self.eyeBtn setImage:[UIImage imageNamed:openImg] forState:UIControlStateSelected];
    kWeakSelf(self)
    [self.eyeBtn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        weakself.tf.secureTextEntry=!weakself.tf.secureTextEntry;
        weakself.eyeBtn.selected=!weakself.eyeBtn.selected;
    }];
    [self addSubview:self.eyeBtn];
    [self.eyeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.right.equalTo(@(GTFixWidthFlaot(0)));
        make.height.equalTo(@(GTFixHeightFlaot(30)));
        make.width.equalTo(@(GTFixWidthFlaot(30)));
    }];

    [self.tf setShouldChangeCharactersInRangeBlock:^BOOL(UITextField *textField, NSRange range, NSString *string) {
        if (textField.text.length >= 15 && string.length) {
            return NO;
        }
        return YES;
    }];
    
}


@end

