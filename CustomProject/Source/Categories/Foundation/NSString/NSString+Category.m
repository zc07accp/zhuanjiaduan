//
//  NSString+Category.m
//  XYZCollection
//
//  Created by xieyan on 15/3/31.
//  Copyright (c) 2015年 xieyan. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

+(NSString*)intString:(NSInteger)number{
    return [NSString stringWithFormat:@"%ld",(long)number];
}
+(NSString*)floatString:(CGFloat)number{
    return [NSString stringWithFormat:@"%02f",number];
}






-(NSString*)addIntNum:(NSInteger)number{
    NSString* num = [NSString intString:[self integerValue]+number];
    return num;
}
-(NSString*)addFloatNum:(CGFloat)number{
    NSString* num = [NSString floatString:[self floatValue]+number];
    return num;
}
-(NSString*)addStringIntNum:(NSString*)number{
    NSString* num = [NSString intString:[self integerValue]+[number integerValue]];
    return num;
}
-(NSString*)addStringFloatNum:(NSString*)number{
    NSString* num = [NSString floatString:[self floatValue]+[number floatValue]];
    return num;
}






-(CGFloat)xyzHeightWithWidth:(CGFloat)width Font:(int)font ParagraphStyle:(NSMutableParagraphStyle*(^)(NSMutableParagraphStyle*))paragraph{
    
    NSMutableParagraphStyle *paragraphStyle = paragraph([[ NSMutableParagraphStyle alloc] init]);

    NSAttributedString* attrStr = [[NSAttributedString alloc] initWithString:self attributes:@{NSParagraphStyleAttributeName:paragraphStyle,NSViewSizeDocumentAttribute:[NSValue valueWithCGSize:CGSizeMake(width, MAXFLOAT)]}];
    
    return [attrStr size].height+0.5;
}


//手机号验证
- (BOOL) validateMobile
{
    NSString *phoneRegex = @"^((13[0-9])|(14[0-9])|(15[^4,\\D])|(17[0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}
// 正则匹配用户密码6-15位数字和字母组合
- (BOOL)checkPassword
{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,15}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
@end
@implementation NSString (validation)

+ (BOOL) isBlank:(NSString*)str{
    if (str == nil || str == NULL) {
        return YES;
    }
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}
+ (NSString *)validateStr:(NSString*)str{
    if ([NSString isBlank:str]) {
        return @"";
    }else{
        return str;
    }
}

@end
