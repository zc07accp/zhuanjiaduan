//
//  FTTextFiled.h
//  Encounter
//
//  Created by 方涛 on 2017/2/21.
//  Copyright © 2017年 zf. All rights reserved.
//

#import "BaseView.h"

@interface FTTextFiled : BaseView
@property(nonatomic,strong)UILabel *lab;//标题
@property(nonatomic,strong)UITextField *tf;//输入框
@property(nonatomic,strong)UIView *line;//添加底部线条
@property(nonatomic,strong)UIButton *eyeBtn;//隐藏显示按钮
@property(nonatomic,strong)UIButton *codeBtn;//发送验证码按钮
//创建左边文字，右边textfiled
-(void)creatTextFiledWithLeftString:(NSString*)str;
//创建左边图片，右边textfiled；
-(void)creatTextFiledWithImage:(NSString*)img;
//设置手机号类型
-(void)phone;
//设置验证码类型textfiled 带按钮
-(void)checkCode;
//密码类型textfiled 带按钮
-(void)pwdTextFiledWithBtnOpenImg:(NSString*)openImg CloseImg:(NSString*)closeImg;
//手机号验证
+ (BOOL) validateMobile:(NSString *)mobile;
// 正则匹配用户密码6-15位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password;
@end
