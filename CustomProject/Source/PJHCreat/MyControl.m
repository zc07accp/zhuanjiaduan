//  MyControl.h
//  LoL
//
//  Created by LoL on 15/4/12.
//  Copyright (c) 2015年 _LoL_. All rights reserved.

UIWindow *_window;
// 窗口的高度
#define XWWindowHeight 20
// 动画的执行时间
#define XWDuration 0.5
// 窗口的停留时间
#define XWDelay 1.5
// 字体大小
#define XWFont [UIFont systemFontOfSize:12]

#import "MyControl.h"
#import "UIButoon+Style.h"

#import "NSString+WPAttributedMarkup.h"
@implementation MyControl

//NSUserDefaults
+(void)setObject:(id)object key:(NSString *)key
{
    if (object) {
        [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
   
}


+(id)getObjectForKey:(NSString *)key
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:key]) {
        return [[NSUserDefaults standardUserDefaults] objectForKey:key];
    }else{
        return NULL;
    }
}
+(void)vc:(id)vc phone:(NSString *)phone
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"客服电话" message:[NSString stringWithFormat:@"确定要拨打%@?",phone] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phone]]];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
}

+(void)removeObjectForKey:(NSString *)key{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:key]) {
        return [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
}

//弹出提示框
+(void)setAlertInfo:(NSString *)info
       andSuperview:(UIView *)view{
    [SGInfoAlert showInfo:info
                  bgColor:[[UIColor blackColor] CGColor]
                   inView:view
                 vertical:0.22 time:2.0 alpha:0.7];
}
//null转化
+(NSDictionary *)nullDic:(NSDictionary *)myDic
{
    NSArray *keyArr = [myDic allKeys];
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < keyArr.count; i ++)
    {
        id obj = [myDic objectForKey:keyArr[i]];
        
        obj = [self changeType:obj];
        
        [resDic setObject:obj forKey:keyArr[i]];
    }
    return resDic;
}
+(id)changeType:(id)myObj
{
    if ([myObj isKindOfClass:[NSDictionary class]])
    {
        return [self nullDic:myObj];
    }
    else if([myObj isKindOfClass:[NSArray class]])
    {
        return [self nullArr:myObj];
    }
    else if([myObj isKindOfClass:[NSString class]])
    {
        return [self stringToString:myObj];
    }
    else if([myObj isKindOfClass:[NSNull class]])
    {
        return [self nullToString];
    }
    else
    {
        return myObj;
    }
}
+(NSArray *)nullArr:(NSArray *)myArr
{
    if ([myArr isKindOfClass:[NSNull class]]) {
        return @[];
    }
    NSMutableArray *resArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < myArr.count; i ++)
    {
        id obj = myArr[i];
        
        obj = [self changeType:obj];
        
        [resArr addObject:obj];
    }
    return resArr;
}
+(NSString *)stringToString:(NSString *)string
{
    return string;
}
+(NSString *)nullToString
{
    return @"";
}

/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

+(void)vc:(id)vc
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:[NSString stringWithFormat:@"确定要拨打%@?",@""] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",@""]]];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
}

/**
 *  根据文字返回高度
 */
+(CGFloat )heightForString:(NSString *)str CGSizeMake:(CGFloat )width font:(CGFloat)font;
{
    if (str.length!=0) {
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
        
        NSRange allRange = [str rangeOfString: str];
        
        [attrStr addAttribute:NSFontAttributeName
         
                        value:[UIFont systemFontOfSize:font]
         
                        range:allRange];
        
        CGFloat titleHeight;
        
        NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
        
        CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                       
                                            options:options
                       
                                            context:nil];
        
        titleHeight = ceilf(rect.size.height);
        
        return titleHeight;
        
    }else{
        return 0;
    }
    
}

/**
 *  根据文字返回size
 */
+ (CGSize)sizeForNoticeTitle:(NSString*)text font:(CGFloat )font{
    CGRect screen = [UIScreen mainScreen].bounds;
    CGFloat maxWidth = screen.size.width;
    CGSize maxSize = CGSizeMake(maxWidth, CGFLOAT_MAX);
    
    CGSize textSize = CGSizeZero;
    // iOS7以后使用boundingRectWithSize，之前使用sizeWithFont
    if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        // 多行必需使用NSStringDrawingUsesLineFragmentOrigin，网上有人说不是用NSStringDrawingUsesFontLeading计算结果不对
        NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin |
        NSStringDrawingUsesFontLeading;
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        [style setLineBreakMode:NSLineBreakByCharWrapping];
        
        NSDictionary *attributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:font], NSParagraphStyleAttributeName : style };
        
        CGRect rect = [text boundingRectWithSize:maxSize
                                         options:opts
                                      attributes:attributes
                                         context:nil];
        textSize = rect.size;
    }
    else{
//        textSize = [text sizeWithFont:[UIFont systemFontOfSize:font] constrainedToSize:maxSize lineBreakMode:NSLineBreakByCharWrapping];
        
    }
    return textSize;
}
//手机号验证
+ (BOOL) validateMobile:(NSString *)mobile
{
    NSString *phoneRegex = @"^((13[0-9])|(14[0-9])|(15[^4,\\D])|(17[0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
+(UIImageView *)setImgViewCornerRadio:(UIImageView *)view width:(CGFloat)width
{
    view.layer.cornerRadius=width/2;
    view.layer.masksToBounds=YES;
    return view;
}

//富文本
+(void)setTitleStyle:(UILabel *)label title:(NSString *)title content:(NSString *)content  foot:(NSString *)foot color: (UIColor *)color  font:(CGFloat)font
{
    NSDictionary* style = @{@"style":@[[UIFont systemFontOfSize:font],@[color]]};
    NSString *str=[NSString stringWithFormat:@"%@<style>%@</style>%@",title,content,foot];
    label.attributedText=[str attributedStringWithStyleBook:style];
}

/**
 *模糊
 */
+(void)setBlurEffect:(UIView *)view
{
    UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:beffect];
    
    effectView.frame =view.frame;
    
    [view addSubview:effectView];
    
}
#pragma 正则匹配用户密码6-15位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password
{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,15}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
    
}

+ (BOOL)checkIsPassword:(NSString *) password
{
    NSString *pattern = @"[A-Za-z]";
    NSString *num =  @"[0-9]*";
    NSPredicate *predNum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", num];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    if ([pred evaluateWithObject:password] || [predNum evaluateWithObject:password]) {
        return YES;
    }
    return NO;
}
#pragma mark  计算缓存大小
+ (float)cacheSize{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    float folderSize=0;
    
    if ([fileManager fileExistsAtPath:[self cachePath]]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:[self cachePath]];
        for (NSString *fileName in childerFiles) {
            NSString *absolutePath=[[self cachePath] stringByAppendingPathComponent:fileName];
            folderSize +=[self fileSizeAtPath:absolutePath];
        }
        
        return folderSize;
    }
    return 0;
}
+(NSString *)cachePath
{
    return     [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    ;
}
+(float)fileSizeAtPath:(NSString *)path
{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:path]){
        long long size=[fileManager attributesOfItemAtPath:path error:nil].fileSize;
        if(size<1){
            return size;
        }else return size/1000.0/1000.0;
    }
    return 0;
}
+ (BOOL)removeCache{
    //===============清除缓存==============
    //获取路径
    NSString*cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0];
    
    //返回路径中的文件数组
    NSArray*files = [[NSFileManager defaultManager]subpathsAtPath:cachePath];
    
    NSLog(@"文件数：%zi",[files count]);
    for(NSString *p in files){
        NSError*error;
        
        NSString*path = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",p]];
        
        if([[NSFileManager defaultManager]fileExistsAtPath:path])
        {
            BOOL isRemove = [[NSFileManager defaultManager]removeItemAtPath:path error:&error];
            if(isRemove) {
                return YES;
            }else{
                return NO;
            }
        }
    }
    return NO;
}
+ (NSString*)jsonStringOfObj:(NSDictionary*)dic{
    NSError *err = nil;
    
    NSData *stringData = [NSJSONSerialization dataWithJSONObject:dic
                                                         options:0
                                                           error:&err];
    
    NSString *str = [[NSString alloc] initWithData:stringData encoding:NSUTF8StringEncoding];
    
    return str;
}
//计算两个日期之间的天数
+ (NSInteger) calcDaysFromBegin:(NSDate *)beginDate end:(NSDate *)endDate
{
    //创建日期格式化对象
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    //取两个日期对象的时间间隔：
    //这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:typedef double NSTimeInterval;
    NSTimeInterval time=[endDate timeIntervalSinceDate:beginDate];
    
    int days=((int)time)/(3600*24);
    //int hours=((int)time)%(3600*24)/3600;
    //NSString *dateContent=[[NSString alloc] initWithFormat:@"%i天%i小时",days,hours];
    return days;
}
//判断字符串是否是纯数字
+ (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

//富文本
+(void)setTitleStyle:(UILabel *)label title:(NSString *)title content:(NSString *)content foot:(NSString *)foot Color:(UIColor* )color
{
    NSDictionary* style = @{@"color":color};
    NSString *str=[NSString stringWithFormat:@"%@<color>%@</color>%@",title,content,foot];
    label.attributedText=[str attributedStringWithStyleBook:style];
}
/**
 选择提示框
 */
+(void)chooseViewWithStr:(NSString*)str superView:(UIView*)view sure:(sure)su cancel:(cancel)cel{
     UIView *bigView=[UIView new];
    bigView.backgroundColor=[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.70f];
    [[UIApplication sharedApplication].keyWindow addSubview:bigView];
    [bigView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
    UIView *bgView=[UIView new];
    bgView.backgroundColor=[UIColor whiteColor];
    bgView.layer.cornerRadius=5;
    bgView.layer.masksToBounds=YES;
    [bigView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(GTFixWidthFlaot(20)));
        make.right.equalTo(@(GTFixWidthFlaot(-20)));
        make.top.equalTo(@(GTFixHeightFlaot(200)));
        make.height.equalTo(@(GTFixHeightFlaot(70)));
    }];
    UILabel *lab=[UILabel labelWithSize:[AppStyleConfiguration appFont:14] withColor:[AppStyleConfiguration ColorWithBottomTabBarSelectColor] withText:str];
    [bgView addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(GTFixWidthFlaot(10)));
        make.right.equalTo(@(GTFixWidthFlaot(-10)));
        make.top.equalTo(@5);
        make.height.equalTo(@(GTFixHeightFlaot(30)));
    }];
    UIButton *cancelBtn=[UIButton buttonWithTitle:@"取消" withTitleColor:[AppStyleConfiguration ColorWithBottomTabBarSelectColor] withSize:14 withImageName:nil withBGColor:nil];
    UIButton *sureBtn=[UIButton buttonWithTitle:@"确定" withTitleColor:[AppStyleConfiguration ColorWithBottomTabBarSelectColor] withSize:14 withImageName:nil withBGColor:nil];
    [cancelBtn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [bigView removeFromSuperview];
        cel();

   }];
    [sureBtn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [bigView removeFromSuperview];
        su();

            }];
    [bgView addSubview:sureBtn];
    [bgView addSubview:cancelBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(GTFixWidthFlaot(-20)));
        make.width.equalTo(@(GTFixWidthFlaot(40)));
        make.bottom.equalTo(@(GTFixHeightFlaot(-10)));
        make.height.equalTo(@(GTFixHeightFlaot(30)));
    }];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(GTFixWidthFlaot(-70)));
        make.width.equalTo(@(GTFixWidthFlaot(40)));
        make.bottom.equalTo(@(GTFixHeightFlaot(-10)));
        make.height.equalTo(@(GTFixHeightFlaot(30)));

    }];
}
/**
 选择提示框
 */
+(void)TiShiKuangWithTitle:(NSString*)title Str:(NSString*)str{
    UIView *bigView=[UIView new];
    bigView.backgroundColor=[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.70f];
    [[UIApplication sharedApplication].keyWindow addSubview:bigView];
    UIView *bgView=[UIView new];
    bgView.backgroundColor=[UIColor whiteColor];
    bgView.layer.cornerRadius=5;
    bgView.layer.masksToBounds=YES;
    [bigView addSubview:bgView];
    UILabel *lab=[UILabel labelWithSize:[AppStyleConfiguration appFont:14] withColor:[AppStyleConfiguration ColorWithBottomTabBarSelectColor] withText:[NSString stringWithFormat:@"%@?",title]];
    [bgView addSubview:lab];
    UILabel *lab2=[UILabel labelWithSize:[AppStyleConfiguration appFont:12] withColor:[AppStyleConfiguration ColorWithBottomTabBarSelectColor] withText:str];
    lab2.numberOfLines=0;
    [bgView addSubview:lab2];
    UIButton *cancelBtn=[UIButton buttonWithTitle:nil withTitleColor:[AppStyleConfiguration ColorWithBottomTabBarSelectColor] withSize:14 withImageName:@"icon_cuowu_shangpinxiangqing" withBGColor:nil];
    [cancelBtn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [bigView removeFromSuperview];
        
    }];
    [bgView addSubview:cancelBtn];
    CGFloat height=[MyControl heightForString:str CGSizeMake:kMainScreen_width-70 font:12];

    [bigView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(GTFixWidthFlaot(20)));
        make.right.equalTo(@(GTFixWidthFlaot(-20)));
        make.top.equalTo(@(GTFixHeightFlaot(200)));
        make.height.equalTo(@(GTFixHeightFlaot(height+60)));
    }];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(GTFixWidthFlaot(20)));
        make.right.equalTo(@(GTFixWidthFlaot(-10)));
        make.top.equalTo(@10);
        make.height.equalTo(@(GTFixHeightFlaot(30)));
    }];
    [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(GTFixWidthFlaot(20)));
        make.right.equalTo(@(GTFixWidthFlaot(-10)));
        make.top.equalTo(@40);
        make.height.equalTo(@(GTFixHeightFlaot(height)));
    }];

     [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(GTFixWidthFlaot(-10)));
        make.width.equalTo(@(GTFixWidthFlaot(30)));
        make.top.equalTo(@(GTFixHeightFlaot(10)));
        make.height.equalTo(@(GTFixHeightFlaot(30)));
        
    }];
}

/**
 带图片，文字的提示框
 */
+(void)TiShiKuangWithString:(NSString*)str Image:(NSString*)Img{
    
    UIView *bigView=[UIView new];
    __weak typeof(bigView) weakbigView = bigView;
     bigView.backgroundColor=[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.70f];
    [[UIApplication sharedApplication].keyWindow addSubview:bigView];
    [bigView addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [weakbigView removeFromSuperview];
    }];

    UIView *bgView=[UIView new];
    bgView.backgroundColor=[UIColor whiteColor];
    bgView.layer.cornerRadius=5;
    bgView.layer.masksToBounds=YES;
    [bigView addSubview:bgView];
    
    UIImageView *imgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:Img]];
    [bgView addSubview:imgV];
    
    UILabel *lab=[UILabel labelWithSize:[AppStyleConfiguration appFont:14] withColor:[UIColor blackColor] withText:[NSString stringWithFormat:@"%@",str]];
    lab.numberOfLines=0;
    lab.textAlignment=NSTextAlignmentCenter;
    [bgView addSubview:lab];
     CGFloat height=[MyControl heightForString:str CGSizeMake:kMainScreen_width-70 font:14];
    
    [bigView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(GTFixWidthFlaot(20)));
        make.right.equalTo(@(GTFixWidthFlaot(-20)));
        make.top.equalTo(@(GTFixHeightFlaot(200)));
        make.height.equalTo(@(GTFixHeightFlaot(height+70)));
    }];
    
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(@(GTFixHeightFlaot(10)));
        make.width.equalTo(@(GTFixHeightFlaot(40)));
        make.height.equalTo(@(GTFixHeightFlaot(40)));
    }];
    
    
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(GTFixWidthFlaot(20)));
        make.right.equalTo(@(GTFixWidthFlaot(-10)));
        make.top.equalTo(@(GTFixHeightFlaot(60)));
        make.height.equalTo(@(GTFixHeightFlaot(height)));
    }];
 }
+(void)SVProgressHUDWithStr:(NSString*)str Image:(NSString*)Img{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:0.9f]];
    [SVProgressHUD setForegroundColor:[AppStyleConfiguration ColorWithMain]];
    [SVProgressHUD setSuccessImage:[UIImage imageNamed:Img]];
    [SVProgressHUD showSuccessWithStatus:str];
    
}


/**
 *验证码输入框
 **/
+(void)setCodeTextFieldStyle:(UITextField *)tf
{
    tf.keyboardType=UIKeyboardTypeNumberPad;
    [tf setShouldChangeCharactersInRangeBlock:^BOOL(UITextField *textField, NSRange range, NSString *string) {
        if (textField.text.length >= 6 && string.length) {
            return NO;
        }else{
            return  [MyControl validateNumber:string];
        }
        return YES;
    }];
}

/**
 *手机号输入框
 **/
+(void)setPhoneTextFieldStyle:(UITextField *)tf
{
    tf.keyboardType=UIKeyboardTypeNumberPad;
    [tf setShouldChangeCharactersInRangeBlock:^BOOL(UITextField *textField, NSRange range, NSString *string) {
        if (textField.text.length >= 11 && string.length) {
            return NO;
        }else{
            return  [MyControl validateNumber:string];
        }
        return YES;
    }];
}

/**
 *交易密码输入框
 **/
+(void)setPayPwdTextFieldStyle:(UITextField *)tf
{
    tf.keyboardType=UIKeyboardTypeNumberPad;
    tf.secureTextEntry=YES;
    [tf setShouldChangeCharactersInRangeBlock:^BOOL(UITextField *textField, NSRange range, NSString *string) {
        if (textField.text.length >= 6 && string.length) {
            return NO;
        }else{
            return  [MyControl validateNumber:string];
        }
        return YES;
    }];
}

/**
 *密码输入框
 **/
+(void)setPwdTextFieldStyle:(UITextField *)tf
{
    tf.keyboardType=UIKeyboardTypeASCIICapable;
    tf.secureTextEntry=YES;
    [tf setShouldChangeCharactersInRangeBlock:^BOOL(UITextField *textField, NSRange range, NSString *string) {
        if (textField.text.length >= 15 && string.length) {
            return NO;
        }else{
            return  [MyControl checkIsPassword:string];
        }
        return YES;
    }];
}

@end
