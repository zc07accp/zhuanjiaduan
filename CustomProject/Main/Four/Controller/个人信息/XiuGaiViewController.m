//
//  XiuGaiViewController.m
//  Zero
//
//  Created by zf on 2018/4/26.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "XiuGaiViewController.h"
#import "FTTextFiled.h"
@interface XiuGaiViewController ()
@property (nonatomic, strong) FTTextFiled* f;
@property (nonatomic, strong) UIButton* Clickbtn;
@property (nonatomic, assign)  int num;
@end

@implementation XiuGaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = [NSString stringWithFormat:@"%@修改",self.titleStr];
    self.f = [FTTextFiled new];


    self.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.96 alpha:1.00];

    [self.view addSubview:self.f];


    [self.f creatTextFiledWithLeftString:[NSString stringWithFormat:@"%@:",self.titleStr]];
    self.f.backgroundColor = [UIColor whiteColor];
    self.f.lab.textColor = [UIColor blackColor];
    if ([self.titleStr isEqualToString:@"昵称"])
    {
        self.f.tf.placeholder =@"不超过16位";
        self.num = 16;
    }

    self.f.tf.textColor = [UIColor blackColor];

    [self.f mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(@90);
        make.left.right.equalTo(@0);
        make.height.equalTo(@45);
    }];
    [[self.f.tf rac_signalForControlEvents:UIControlEventEditingChanged] subscribeNext:^(id x){

        UITextField *f =  (UITextField*)x;

        if (f.text.length>self.num)
        {
            self.f.tf.text  =[f.text substringToIndex:self.num];

            [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"字符个数不能超过%d",self.num]];
        }
        else

        {
             self.f.tf.text  = f.text ;
        }

    }];

   self.Clickbtn = [UIButton buttonWithTitle:@"保存" withImageName: nil withBGColor:[AppStyleConfiguration ColorWithMain] Withlayer:YES];


    [self.view addSubview:self.Clickbtn];

    [self.Clickbtn mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.f.mas_bottom).offset(50);

        make.left.equalTo(@40);
        make.right.equalTo(@-40);

        make.height.equalTo(@45);
    }];
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
