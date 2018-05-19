//
//  RegistDetailVC.m
//  Zero
//
//  Created by zf on 2018/4/9.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "RegistDetailVC.h"
#import "STPickerArea.h"
#import "ZFTwoSectionPickerView.h"
@interface RegistDetailVC ()<STPickerAreaDelegate,ZFTwoSectionPickerViewDelegate>
@property (nonatomic, strong) RegistDetailView *loginV;

@end

@implementation RegistDetailVC


-(RegistDetailView *)loginV{
    if (!_loginV) {
        _loginV=[[RegistDetailView alloc]initWithFrame:self.view.frame];
        //年级
        [_loginV.YearTF addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {

            ZFTwoSectionPickerView *pickerArea = [[ZFTwoSectionPickerView alloc]init];
            [pickerArea setDelegate:self];
            [pickerArea setSaveHistory:YES];
            [pickerArea setContentMode:STPickerContentModeBottom];
            [pickerArea show];
        }];
        //城市
        [_loginV.CityTF addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {

            STPickerArea *pickerArea = [[STPickerArea alloc]init];
            [pickerArea setDelegate:self];
            [pickerArea setSaveHistory:YES];
            [pickerArea setContentMode:STPickerContentModeBottom];
            [pickerArea show];
        }];

        [_loginV.sureBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];


    }
    return _loginV;
}
- (void)loginBtnClick:(UIButton*)sender
{
    
}
//班级选择
-(void)pickerArea:(ZFTwoSectionPickerView *)pickerArea Year:(NSString *)Year Type:(NSString *)Type
{
    self.loginV.YearTF.tf.text = [NSString stringWithFormat:@"%@ %@", Type,Year];
}
//地址选择器
- (void)pickerArea:(STPickerArea *)pickerArea province:(NSString *)province city:(NSString *)city area:(NSString *)area
{

    NSString *text ;
    if ([province isEqualToString:city])
    {
         text = [NSString stringWithFormat:@"%@  %@", province, area];
    }
    else
    {
        text = [NSString stringWithFormat:@"%@ %@ %@", province, city, area];
    }

    self.loginV.CityTF.tf.text = text;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.loginV];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
