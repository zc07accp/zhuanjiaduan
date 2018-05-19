//
//  SureGuideView.m
//  FaceLoan
//
//  Created by mozhu on 16/12/23.
//  Copyright © 2016年 zf. All rights reserved.
//

#import "SureGuideView.h"

#define IS_iPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136),[[UIScreen mainScreen] currentMode].size): NO)
#define IS_iPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334),[[UIScreen mainScreen] currentMode].size)): NO)
#define IS_iPHONE6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1242, 2208),[[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1125, 2001),[[UIScreen mainScreen] currentMode].size)): NO)

NSString *const SureShouldShowGuide = @"SureShouldShowGuide";
@interface SureGuideView ()
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, assign) NSInteger imageCount;
@end
@implementation SureGuideView
+ (instancetype)sureGuideViewWithImageName:(NSString*)imageName imageCount:(NSInteger)imageCount{
    return [[self alloc]initWithImageName:imageName imageCount:imageCount];
}
- (instancetype)initWithImageName:(NSString*)imageName
                       imageCount:(NSInteger)imageCount{
    if (self = [super init]) {
        _imageName = imageName;
        _imageCount = imageCount;
        [self createUI];
    }
    return self;
}
- (void)createUI {
    self.backgroundColor = [UIColor clearColor];
    self.frame = CGRectMake(0, 0, kMainScreen_width, kMainScreen_height);
    if (_imageCount) {
        NSString *realImageName =@"";
        for (NSInteger i = 0; i < _imageCount; i++) {
            //当前设备为iphone5/5S
            if (IS_iPHONE5) {
                realImageName = [NSString stringWithFormat:@"%@_%ld_iphone5",_imageName,i+1];
            }
            //当前设备为iphone6/6S/7
            if (IS_iPHONE6) {
                realImageName = [NSString stringWithFormat:@"%@_%ld_iphone6",_imageName,i+1];
            }
            //当前设备为iphone6P/6SP/7P
            if (IS_iPHONE6P) {
                realImageName = [NSString stringWithFormat:@"%@_%ld_iphone6s",_imageName,i+1];
            }
            
            UIImage *image = [UIImage imageNamed:realImageName];
            UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
            imageView.frame = CGRectMake(0, 0, kMainScreen_width, kMainScreen_height);
            imageView.userInteractionEnabled = YES;
            imageView.tag = 1000 + i;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchImageView:)];
            [imageView addGestureRecognizer:tap];
            imageView.hidden=YES;
            if (i==0) {
                imageView.hidden=NO;
            }
            [self addSubview:imageView];
        }
    }
    [self show];
}

- (void)touchImageView:(UITapGestureRecognizer*)tap {
    UIImageView *tapImageView = (UIImageView*)tap.view;
    //依次移除
    [tapImageView removeFromSuperview];
    if (tapImageView.tag - 1000 == _imageCount-1) {
        //最后一张
        if (self.lastTapBlock) {
            self.lastTapBlock();
        }
        [self hide];
    }else{
        [[self viewWithTag:tap.view.tag+1] setHidden:NO];
    }
}

- (void)show {
//    [UIApplication sharedApplication].statusBarHidden = YES;
    AppDelegate *appDel = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [appDel.window addSubview:self];
}

- (void)hide {
    [[NSUserDefaults standardUserDefaults]setObject:@200 forKey:SureShouldShowGuide];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [UIApplication sharedApplication].statusBarHidden = NO;
    [self removeFromSuperview];
}

+ (BOOL)shouldShowGuider {
    NSNumber *number = [[NSUserDefaults standardUserDefaults]objectForKey:SureShouldShowGuide];
    if ([number isEqual:@200]) {
        return NO;
    } else {
        return YES;
    }
}

@end
