
//
//  SearchVC.m
//  Zero
//
//  Created by 方涛 on 2018/4/26.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "SearchVC.h"
#import "ThirdView.h"
#define k_LISHI @"lishi"
@interface SearchVC ()<UITextFieldDelegate>
@property(nonatomic,strong)SearchView *searchV;
@property(nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation SearchVC
-(NSMutableArray *)dataSource
{
    
    if (!_dataSource ) {
        _dataSource = [NSMutableArray new] ;
        [_dataSource addObjectsFromArray:[MyControl getObjectForKey:k_LISHI]];
    }
    return _dataSource;
}

-(SearchView *)searchV{
    if (!_searchV) {
        kWeakSelf(self)
        _searchV=[[SearchView alloc]initWithFrame:CGRectMake(0, 0, kMainScreen_width, kMainScreen_height)];
        [_searchV.cancelBtn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weakself.navigationController popViewControllerAnimated:YES];
        }];
        _searchV.textTF.delegate=self;
        [self.view addSubview:_searchV];

    }
    return _searchV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self searchV];
    [self configTagView];
    
}
-(void)set_noNavView{
    
}
-(void)set_noLeftButton{
    
}

// 配置
- (void)configTagView
{
    
    kWeakSelf(self)
    [self.searchV.tagView removeAllTags];
    // 整个tagView对应其SuperView的上左下右距离
    self.searchV.tagView.padding = UIEdgeInsetsMake(10, 20, 10, 20);
    // 上下行之间的距离
    self.searchV.tagView.lineSpacing = 10;
    // item之间的距离
    self.searchV.tagView.interitemSpacing = 20;
    // 最大宽度
    self.searchV.tagView.preferredMaxLayoutWidth = 375;
    //    @property (assign, nonatomic) CGFloat regularWidth; //!< 固定宽度
    //    @property (nonatomic,assign ) CGFloat regularHeight; //!< 固定高度
    // 原作者没有能加固定宽度的，自己修改源码加上了固定宽度和高度,默认是0，就是标签式布局，如果实现了，那么就是固定宽度高度
    //    self.tagView.regularWidth = 100;
    //    self.tagView.regularHeight = 30;
    // 开始加载
    [self.dataSource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 初始化标签
        SKTag *tag = [[SKTag alloc] initWithText:self.dataSource[idx]];
        // 标签相对于自己容器的上左下右的距离
        tag.padding = UIEdgeInsetsMake(5, 10, 5, 10);
        // 弧度
        tag.cornerRadius = 5.0f;
        // 字体
        tag.font = [UIFont boldSystemFontOfSize:12];
        // 边框宽度
        tag.borderWidth = 1;
        // 边框颜色
        tag.borderColor = [AppStyleConfiguration ColorWithMain];
        // 字体颜色
        tag.textColor = [AppStyleConfiguration ColorWithTextTwo];
        // 是否可点击
        tag.enable = YES;
        // 加入到tagView
        [self.searchV.tagView addTag:tag];
    }];
    // 点击事件回调
    self.searchV.tagView.didTapTagAtIndex = ^(NSUInteger idx){
        
        NSLog(@"点击了第%ld个",idx);
        [weakself.navigationController popViewControllerAnimated:YES];
        
    };
    
  
    [self.searchV.tagView layoutSubviews];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
  
    
    if (textField.text.length) {
        
        if (![self.dataSource containsObject: textField.text]) {
            
            if (self.dataSource.count>=10) {
                [self.dataSource removeObjectAtIndex:self.dataSource.count-1];
                [self.dataSource insertObject:textField.text atIndex:0];

            }else{
                [self.dataSource insertObject:textField.text atIndex:0];

            }
            [MyControl setObject:self.dataSource key:k_LISHI];
            
        }
        [self configTagView];
        
    }else{
        [SVProgressHUD showErrorWithStatus:@"请输入关键词"];
    }
    
//    [textField resignFirstResponder];
    return YES;
}
@end
