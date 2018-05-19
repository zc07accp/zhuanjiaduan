//
//  FTPickerDataMin.m
//  InvestApp
//
//  Created by 方涛 on 2016/11/10.
//  Copyright © 2016年 Puyue. All rights reserved.
//

#import "FTPickerDataMin.h"//FTPickerViewMinute//FTPickerDataMin

#import "NSCalendar+ST.h"
@interface FTPickerDataMin()<UIPickerViewDataSource, UIPickerViewDelegate>
/** 1.年 */
@property (nonatomic, assign)NSInteger year;
/** 2.月 */
@property (nonatomic, assign)NSInteger month;
/** 3.日 */
@property (nonatomic, assign)NSInteger day;
@property (nonatomic, assign)NSInteger hour;
@property (nonatomic, assign)NSInteger min;

@property (nonatomic, assign) NSInteger yearStr;
@property (nonatomic, assign) NSInteger monthStr;
@property (nonatomic, assign) NSInteger dayStr;
@property (nonatomic, assign) NSInteger Max;
@end

@implementation FTPickerDataMin

#pragma mark - --- init 视图初始化 ---

- (void)setupUI {
    
    self.title = @" ";

    _heightPickerComponent = 28;
    _year  = [NSCalendar currentYear];
    _month = [NSCalendar currentMonth];
    _day   = [NSCalendar currentDay]+1;

    self.Max = [NSCalendar getDaysWithYear:_year month:_month];


    if (_day<self.Max)
    {
         _day   = [NSCalendar currentDay]+1;
    }
    else
    {
        _day = [NSCalendar currentDay];
    }
//    _hour=[NSCalendar currentHour];
//    _min=[NSCalendar currnentMinute];
    [self.pickerView setDelegate:self];
    [self.pickerView setDataSource:self];
    [self.pickerView selectRow:(_month ) inComponent:1 animated:NO];
    [self.pickerView selectRow:(_day) inComponent:2 animated:NO];
//    [self.pickerView selectRow:(_hour-1) inComponent:4 animated:NO];
//    [self.pickerView selectRow:(_min-1) inComponent:6 animated:NO];

}

#pragma mark - --- delegate 视图委托 ---

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0) {
        return 1;

    }else if(component == 1)
    {

        if (_day+7>self.Max &&_month+1<13)
        {

            return 2;

        }
        else
        {
            return 1;
        }

    }else

    {
        return 7;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return self.heightPickerComponent;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            [pickerView reloadComponent:0];
            break;
        case 1:
            [pickerView reloadComponent:1];

            break;
        case 2:
            [pickerView reloadComponent:2];
            break;

            default:
            break;
    }

   [self reloadData];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view
{
    NSString *text;
    UILabel *label = [[UILabel alloc]init];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont systemFontOfSize:17]];


    switch (component)
    {
        case 0:
            text = [NSString stringWithFormat:@"%ld年",(long)_year];
            break;
        case 1:
            if ((_day+row>=self.Max) && _month+1<13)
            {
                if (_day==self.Max&&(row==0))
                {

                    text = [NSString stringWithFormat:@"%02ld月",_month];
                }
                else
                {
                    text = [NSString stringWithFormat:@"%02ld月",_month+1];
                }

            }
            else
            {
                text = [NSString stringWithFormat:@"%02ld月",_month];
            }
            break;
            case 2:
            if (_day+row>self.Max)
            {
                text  = [NSString stringWithFormat:@"%02ld日",_day+row-self.Max];
            }
            else
            {
                text  = [NSString stringWithFormat:@"%02ld日",_day+row];

            }

            break;
               default:
            break;
    }
    [label setText:text];
    return label;
}
#pragma mark - --- event response 事件相应 ---

- (void)selectedOk
{
    if ([self.delegate respondsToSelector:@selector(pickerDate:year:month:day:hour:min:)]) {

        if (self.yearStr==0)
        {
            self.yearStr = _year;
        }

        if (self.monthStr==0)
        {
            self.monthStr = _month;
        }
        if (self.dayStr==0)
        {
            self.dayStr = _day;
        }
        [self.delegate pickerDate:self year:self.yearStr month:self.monthStr day:self.dayStr hour:self.hour min:self.min];
    }
    
    [super selectedOk];
}

#pragma mark - --- private methods 私有方法 ---

- (void)reloadData
{

//    self.year = [self.pickerView selectedRowInComponent:0];
//    self.month = [self.pickerView selectedRowInComponent:1];
    self.yearStr = _year;

    if (_day+[self.pickerView selectedRowInComponent:2]>self.Max &&_month+1<13)
    {

        self.monthStr = _month+1;
    }
    else
    {
        self.monthStr= _month;
    }


    if (_day+[self.pickerView selectedRowInComponent:2]>self.Max)
    {

        self.dayStr   = _day+[self.pickerView selectedRowInComponent:2]-self.Max;
    }
    else
    {
        self.dayStr   = _day+[self.pickerView selectedRowInComponent:2];

    }




}
@end
