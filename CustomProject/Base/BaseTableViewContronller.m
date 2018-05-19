//
//  BaseTableViewContronller.m
//  CustomProject
//
//  Created by mozhu on 2017/9/28.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "BaseTableViewContronller.h"
#import "UIScrollView+DREmptyDataSet.h"
@interface BaseTableViewContronller ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@end

@implementation BaseTableViewContronller
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView=[UIView new];
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            
        }
        _tableView.emptyDataSetSource = self;
        _tableView.emptyDataSetDelegate = self;
    }
    return _tableView;
}
-(void)setHasHead:(BOOL)hasHead
{
    _hasHead=hasHead;
    if (hasHead) {
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    }
}
-(void)setHasFoot:(BOOL)hasFoot
{
    _hasFoot=hasFoot;
    if (hasFoot) {
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
}
-(void)setHasHeadAndfoot:(BOOL)hasHeadAndfoot
{
    _hasHeadAndfoot=hasHeadAndfoot;
    if (hasHeadAndfoot) {
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
}

- (void)setLoading:(BOOL)loading
{
    if (self.loading == loading) {
        return;
    }
    _loading = loading;
    [self.tableView reloadEmptyDataSet];
}

-(NSMutableArray *)listArr
{
    if (!_listArr) {
        _listArr=[[NSMutableArray alloc]init];
    }
    return _listArr;
}
#pragma mark 下拉刷新
-(void)loadNewData
{
    self.page=1;
    [self loadData];
}
#pragma mark 上拉加载
-(void)loadMoreData
{
    if ([self.next integerValue]==0) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        return;
    }
    self.page++;
    [self loadData];
}
-(void)headerFooterHidden
{
    self.loading=NO;
    self.tableView.mj_footer.hidden=!self.listArr.count;

    if (self.page==1) {
        [self.tableView.mj_header endRefreshing];
    }
    [self.tableView.mj_footer endRefreshing];
    [self.tableView reloadData];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
   
}
-(void)networkState:(NSNotification *)note
{
    NSDictionary *userInfo= note.userInfo;
    if ([userInfo[@"state"] isEqualToString:@"yes"]) {//有网络
        self.netWorkState=YES;
    }else{
        self.netWorkState=NO;
    }
    
}
-(void)setNetWorkState:(BOOL)netWorkState
{
    _netWorkState=netWorkState;
    if (!_netWorkState) {//无网络
        self.loading=NO;
        [self.tableView reloadEmptyDataSet];
    }else{
        self.loading=YES;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backColor=[UIColor whiteColor];
    self.allowSroll=NO;
    self.page=1;
    self.showEmpty=NO;
    self.netWorkState=YES;
    self.errorEmptyImage=@"error";
    [RACObserve([BaseUtils sharedInstance], networkState)subscribeNext:^(NSString * x) {
        if ([x isEqualToString:@"yes"]) {
            self.netWorkState=YES;
        }else{
            self.netWorkState=NO;
        }
    }];
    
    [self.view addSubview:self.tableView];
}
-(void)loadData
{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}
#pragma mark - DZNEmptyDataSetSource Methods

//按钮
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    if (!self.loading) {
        NSString *text = self.emptyText?:@"没有找到任何数据";
        if (!self.netWorkState) {
            text=@"暂无网络,请刷新重试";
        }
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setValue:[UIColor lightGrayColor] forKey:NSForegroundColorAttributeName];
        [dic setValue:[UIFont systemFontOfSize:20] forKey:NSFontAttributeName];
        return [[NSAttributedString alloc] initWithString:text attributes:dic];
    }
    return nil;
}

//设置Button 的 图片
//- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
//{
//    return [UIImage imageNamed:@"placeholder_kickstarter"];
//}
//背景颜色(当没有数据的时候设置背景颜色)
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.backColor;
}

//是否允许滚动，默认NO
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return self.allowSroll;
}

// 垂直偏移量
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView{
    return self.offset;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    if (self.loading) { //加载状态
        return  [UIImage imageNamed:self.loadImage ? :@"loading_gray"];
    }
    else {
        if (!self.netWorkState) {
            return [UIImage imageNamed:self.errorEmptyImage];
        }
        return [UIImage imageNamed:self.emptyImage ?: @"placeholder_kickstarter"];
    }
}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    if (self.loading) {//加载转圈
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
        animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0) ];
        animation.duration = 0.25;
        animation.cumulative = YES;
        animation.repeatCount = MAXFLOAT;
        
        return animation;
    }else{//点击弹性
        CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        animation.duration = 0.25;
        
        NSMutableArray *values = [NSMutableArray array];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.6, 0.6, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
        animation.values = values;
        return animation;
    }
    
}
- (void)emptyDataSetWillAppear:(UIScrollView *)scrollView {
    scrollView.contentOffset = CGPointZero;
}
//是否显示无数据状态
- (BOOL)emptyDataSetShouldBeForcedToDisplay:(UIScrollView *)scrollView
{
    return self.showEmpty;
}
- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView
{
    return YES;
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    self.loading = YES;
    
    [self loadData];
    
#warning 模拟-后面删除
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.loading = NO;
    });
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    self.loading = YES;
    
    [self loadData];
    
#warning 模拟-后面删除
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.loading = NO;
    });
}

@end
