//
//  SureGuideView.h
//  FaceLoan
//
//  Created by mozhu on 16/12/23.
//  Copyright © 2016年 zf. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *const SureShouldShowGuide;

@interface SureGuideView : UIView

@property (nonatomic, copy) void(^lastTapBlock)(void);

+ (instancetype)sureGuideViewWithImageName:(NSString*)imageName imageCount:(NSInteger)imageCount;

+ (BOOL)shouldShowGuider;

- (void)show;
@end
