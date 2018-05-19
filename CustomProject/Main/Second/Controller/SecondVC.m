//
//  SecondVC.m
//  CustomProject
//
//  Created by mozhu on 17/3/9.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "SecondVC.h"
#import "CuoTiCollectionViewCell.h"
@interface SecondVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *mainCollectionView;
@end

@implementation SecondVC
-(UICollectionView *)mainCollectionView
{
    if (!_mainCollectionView)
    {
        //1.初始化layout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //该方法也可以设置itemSize
        //   layout.itemSize =CGSizeMake(150, 250);
        //2.初始化collectionView
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,64, kMainScreen_width, kMainScreen_height - kMainBottomHeight-64) collectionViewLayout:layout];
        _mainCollectionView.backgroundColor=[UIColor clearColor];
        _mainCollectionView.delegate=self;
        _mainCollectionView.dataSource=self;

        [self.mainCollectionView registerNib:[UINib nibWithNibName:@"CuoTiCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
        _mainCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        _mainCollectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
    return _mainCollectionView;
}
-(void)loadNewData
{
    [self.mainCollectionView.mj_header endRefreshing];
    [self.mainCollectionView.mj_footer endRefreshing];
}
-(void)loadMoreData
{
    [self.mainCollectionView.mj_header endRefreshing];
    [self.mainCollectionView.mj_footer endRefreshing];
}
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//返回item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 11;
}


//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{


    return CGSizeMake(kMainScreen_width/2-20 , GTFixHeightFlaot(90));
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{

    return 20;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    // 如果取出的唯一标示符不存在，则初始化唯一标示符，并将其存入字典中，对应唯一标示符注册Cell



    CuoTiCollectionViewCell *cell =    [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell)
    {
        // 注册Cell
        [self.mainCollectionView registerClass:[UICollectionViewCell class]  forCellWithReuseIdentifier:@"cell"];
    }
    [cell.BGImageView sd_setImageWithURL:[NSURL URLWithString:@"http://baidu"] placeholderImage:[UIImage imageNamed:@"ico_wuli_cuoti"]];
    return cell;
}

//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view insertSubview:self.mainCollectionView atIndex:0];
    self.navTitle=@"错题本";
}


@end
