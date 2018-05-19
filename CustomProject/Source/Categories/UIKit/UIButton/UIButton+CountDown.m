//
//  UIButton+countDown.m
//  NetworkEgOc
//
//  Created by iosdev on 15/3/17.
//  Copyright (c) 2015年 iosdev. All rights reserved.
//

#import "UIButton+CountDown.h"
#import "UIButoon+Style.h"

NSString *identi = @"countingTime";

@implementation UIButton (countDown)
-(void)startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle{
    __block NSInteger timeOut=timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:tittle forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
                [self setDisabled:NO];
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeOut % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"____%@",strTime);
                [self setTitle:[NSString stringWithFormat:@"%@%@",strTime,waitTittle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                [self setDisabled:YES];

            });
            timeOut--;

        }
    });
    objc_setAssociatedObject(self, &identi, _timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    dispatch_resume(_timer);

}
/**
 设置开始背景色  结束背景色
 */
-(void)FTstartTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle enableColor:(UIColor *)enableColor startColor:(UIColor*)startColor{
    __block NSInteger timeOut=timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:tittle forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
                self.backgroundColor = enableColor;
                
                
            });
        }else{
            //            int minutes = timeout / 60;
            //            int seconds = timeOut % 60;
            //            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:[NSString stringWithFormat:@"%ld%@",timeOut,waitTittle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                self.backgroundColor = startColor;
                
            });
            timeOut--;
            
        }
    });
    objc_setAssociatedObject(self, &identi, _timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    dispatch_resume(_timer);
    
}
/**
 设置开始背景色  结束背景色 等待按钮字体颜色  结束后按钮字颜色
 */
-(void)DaiJiShiStartTime:(NSInteger )timeout title:(NSString *)tittle TitleColor:(UIColor*)titleColor waitTittle:(NSString *)waitTittle WaitTittleColor:(UIColor*)waitTittleColor enableColor:(UIColor *)enableColor startColor:(UIColor*)startColor{
    __block NSInteger timeOut=timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:tittle forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
                if (enableColor) {
                    self.backgroundColor = enableColor;

                }
                if (titleColor) {
                    [self setTitleColor:titleColor forState:UIControlStateNormal];
                }
                
                
            });
        }else{
            //            int minutes = timeout / 60;
            //            int seconds = timeOut % 60;
            //            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:[NSString stringWithFormat:@"%ld%@",timeOut,waitTittle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                if (startColor) {
                    self.backgroundColor = startColor;
                }
                if (waitTittleColor) {
                    [self setTitleColor:waitTittleColor forState:UIControlStateNormal];
                }
            });
            timeOut--;
            
        }
    });
    objc_setAssociatedObject(self, &identi, _timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    dispatch_resume(_timer);
    
}
- (void)stopTime{
    dispatch_source_t _timer = objc_getAssociatedObject(self, &identi);
    if (_timer) {
        dispatch_source_cancel(_timer);
    }
}
@end

