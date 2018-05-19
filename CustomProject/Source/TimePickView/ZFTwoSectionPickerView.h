//
//  ZFTwoSectionPickerView.h
//  Zero
//
//  Created by zf on 2018/4/10.
//  Copyright © 2018年 puyue.com. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "STPickerView.h"
NS_ASSUME_NONNULL_BEGIN
@class ZFTwoSectionPickerView;
@protocol  ZFTwoSectionPickerViewDelegate<NSObject>

- (void)pickerArea:(ZFTwoSectionPickerView *)pickerArea Year:(NSString *)Year Type:(NSString *)Type ;

@end
@interface ZFTwoSectionPickerView : STPickerView
/** 1.中间选择框的高度，default is 32*/
@property(nonatomic, assign)CGFloat heightPickerComponent;
/** 2.保存之前的选择地址，default is NO */
@property(nonatomic, assign, getter=isSaveHistory)BOOL saveHistory;

@property(nonatomic, weak)id <ZFTwoSectionPickerViewDelegate>delegate;

@end
NS_ASSUME_NONNULL_END
