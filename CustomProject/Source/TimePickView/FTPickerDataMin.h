//
//  FTPickerDataMin.h
//  InvestApp
//
//  Created by 方涛 on 2016/11/10.
//  Copyright © 2016年 Puyue. All rights reserved.
//

#import "STPickerView.h"


NS_ASSUME_NONNULL_BEGIN
@class FTPickerDataMin;
@protocol  FTPickerDataMinDelegate<NSObject>
- (void)pickerDate:(FTPickerDataMin *)pickerDate year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour min:(NSInteger)min;

@end
@interface FTPickerDataMin : STPickerView
@property (nonatomic, strong) NSIndexPath* path;
/** 1.最小的年份，default is 1900 */
@property (nonatomic, assign)NSInteger yearLeast;
/** 2.显示年份数量，default is 200 */
@property (nonatomic, assign)NSInteger yearSum;
/** 3.中间选择框的高度，default is 28*/
@property (nonatomic, assign)CGFloat heightPickerComponent;

@property(nonatomic, weak)id <FTPickerDataMinDelegate>delegate ;

@end
NS_ASSUME_NONNULL_END
