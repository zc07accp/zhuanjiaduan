

//
//  FeedBackVC.m
//  Zero
//
//  Created by 方涛 on 2018/4/28.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "FeedBackVC.h"
#import "UITextView+PlaceHolder.h"

@interface FeedBackVC ()
@property(nonatomic,strong)UITextView *textV;

@end

@implementation FeedBackVC
-(UITextView *)textV{
    if (!_textV) {
        _textV=[UITextView new];
        _textV.tintColor=[AppStyleConfiguration ColorWithTextOne];
        _textV.textColor=[AppStyleConfiguration ColorWithTextOne];
        _textV.font=[AppStyleConfiguration appFont:14];
        [_textV addPlaceHolder:@"既然来了，给我们提点意见吧~"];
        _textV.frame=CGRectMake(15, 15, kMainScreen_width-30, 180);
    }
    return _textV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle=@"意见反馈";
    self.navRightBtnTitle=@"提交";
    self.view.backgroundColor=[AppStyleConfiguration ColorWithBaseBoard];
    [self.navRightBtn setTitleColor:[AppStyleConfiguration ColorWithTextOne] forState:UIControlStateNormal];
    [self addTextView];
}
-(void)addTextView{
    UIView *ve=[[UIView alloc]initWithFrame:CGRectMake(0, 20+kMainTopHeight, kMainScreen_width, 210)];
    ve.backgroundColor=[UIColor whiteColor];
    [ve addSubview:self.textV];
    [self.view addSubview:ve];
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
