//
//  ZFTwoSectionPickerView.m
//  Zero
//
//  Created by zf on 2018/4/10.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "ZFTwoSectionPickerView.h"

@interface ZFTwoSectionPickerView()<UIPickerViewDataSource, UIPickerViewDelegate>


/** 初中高总数组 */
@property (nonatomic, strong, nullable)NSMutableArray *arraytype;
/** 年级数组 */
@property (nonatomic, strong, nullable)NSMutableArray *arrayyear;



@property (nonatomic, strong, nullable)NSString *type;//初中，高中
/** 7.城市 */
@property (nonatomic, strong, nullable)NSString *year;// 年级


@end


@implementation ZFTwoSectionPickerView

#pragma mark - --- init 视图初始化 ---

- (void)setupUI
{
    self.saveHistory = NO;
    // 2.设置视图的默认属性
    _heightPickerComponent = 32;
    [self setTitle:@"请选择年级"];
    [self.pickerView setDelegate:self];
    [self.pickerView setDataSource:self];

}
#pragma mark - --- delegate 视图委托 ---

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return self.arraytype.count;

    }else
    {
        return self.arrayyear.count;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return self.heightPickerComponent;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        switch (row)
        {
            case 0:
                self.arrayyear  =  @[@"一年级",@"二年级",@"三年级",@"四年级",@"五年级",@"六年级"].mutableCopy;
                break;
            case 1:
                self.arrayyear  =  @[@"一年级",@"二年级",@"三年级"].mutableCopy;
                break;
            case 2:
                self.arrayyear  =  @[@"一年级",@"二年级",@"三年级"].mutableCopy;
                break;
            default:
                break;
        }
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        self.type = self.arraytype[row];
    }else
    {
        self.year = self.arrayyear[row];
    }
    [self reloadData];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view
{

    //设置分割线的颜色
    [pickerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.frame.size.height <=1) {
            obj.backgroundColor = self.borderButtonColor;
        }
    }];


    NSString *text;
    if (component == 0)
    {
        text =  self.arraytype[row];
    }else{
        text =  self.arrayyear[row];
    }

    UILabel *label = [[UILabel alloc]init];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont systemFontOfSize:17]];
    [label setText:text];
    return label;
}
#pragma mark - --- event response 事件相应 ---

- (void)selectedOk
{

    if (self.type.length==0 )
    {
        self.type = self.arraytype[0];
        self.year = self.arrayyear[0];
    }

    if (self.isSaveHistory) {
        NSDictionary *dicHistory = @{ @"type":self.type, @"year":self.year};
        [[NSUserDefaults standardUserDefaults] setObject:dicHistory forKey:@"ZFTwoSectionPickerView"];
    }else {
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"ZFTwoSectionPickerView"];
    }

    if ([self.delegate respondsToSelector:@selector(pickerArea:Year:Type:)])
    {
        [self.delegate pickerArea:self Year:self.year Type:self.type];
    }
    [super selectedOk];
}

#pragma mark - --- private methods 私有方法 ---

- (void)reloadData
{
    NSInteger index0 = [self.pickerView selectedRowInComponent:0];
    NSInteger index1 = [self.pickerView selectedRowInComponent:1];

    self.type = self.arraytype[index0];
    self.year = self.arrayyear[index1];

    NSString *title = [NSString stringWithFormat:@"%@ %@", self.type, self.year];
    [self setTitle:title];

}

#pragma mark - --- setters 属性 ---
//
//- (void)setSaveHistory:(BOOL)saveHistory
//{
//    _saveHistory = saveHistory;
//
//    if (saveHistory) {
//        NSDictionary *dicHistory = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"STPickerArea"];
//        __block NSUInteger numberProvince = 0;
//        __block NSUInteger numberCity = 0;
//        __block NSUInteger numberArea = 0;
//
//        if (dicHistory) {
//            NSString *province = [NSString stringWithFormat:@"%@", dicHistory[@"province"]];
//            NSString *city = [NSString stringWithFormat:@"%@", dicHistory[@"city"]];
//            NSString *area = [NSString stringWithFormat:@"%@", dicHistory[@"area"]];
//
//            [self.arrayProvince enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                if ([obj isEqualToString:province]) {
//                    numberProvince = idx;
//                }
//            }];
//
//            self.arraySelected = self.arrayRoot[numberProvince][@"cities"];
//
//            [self.arrayCity removeAllObjects];
//            [self.arraySelected enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                [self.arrayCity addObject:obj[@"city"]];
//            }];
//
//            [self.arrayCity enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                if ([obj isEqualToString:city]) {
//                    numberCity = idx;
//                }
//            }];
//
//
//            if (self.arraySelected.count == 0) {
//                self.arraySelected = [self.arrayRoot firstObject][@"cities"];
//            }
//
//            self.arrayArea = [NSMutableArray arrayWithArray:[self.arraySelected objectAtIndex:numberCity][@"areas"]];
//
//            [self.arrayArea enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                if ([obj isEqualToString:area]) {
//                    numberArea = idx;
//                }
//            }];
//
//            [self.pickerView selectRow:numberProvince inComponent:0 animated:NO];
//            [self.pickerView selectRow:numberCity inComponent:1 animated:NO];
//            [self.pickerView selectRow:numberArea inComponent:2 animated:NO];
//            [self.pickerView reloadAllComponents];
//            [self reloadData];
//        }
//    }
//}

#pragma mark - --- getters 属性 ---




- (NSMutableArray *)arrayyear
{
    if (!_arrayyear) {
         _arrayyear  =  @[@"一年级",@"二年级",@"三年级",@"四年级",@"五年级",@"六年级"].mutableCopy;
    }
    return _arrayyear;
}

- (NSMutableArray *)arraytype
{
    if (!_arraytype) {
        _arraytype = @[@"小学",@"初中",@"高中"].mutableCopy;
    }
    return _arraytype;
}

@end
