//
//  CropImageViewController.m
//  ImageTailor
//
//  Created by yinyu on 15/10/10.
//  Copyright © 2015年 yinyu. All rights reserved.
//

#import "CropImageViewController.h"
#import "TKImageView.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define CROP_PROPORTION_IMAGE_WIDTH 30.0f
#define CROP_PROPORTION_IMAGE_SPACE 48.0f
#define CROP_PROPORTION_IMAGE_PADDING 20.0f

@interface CropImageViewController () {
    
    NSArray *proportionImageNameArr;
    NSArray *proportionImageNameHLArr;
    NSArray *proportionArr;
    NSMutableArray *proportionBtnArr;
    CGFloat currentProportion;

}
@property (weak, nonatomic) IBOutlet UIScrollView *cropProportionScrollView;
@property (weak, nonatomic) IBOutlet TKImageView *tkImageView;

@end

@implementation CropImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navView .hidden = YES;
    self.view.backgroundColor = [UIColor blackColor];
    [self setUpTKImageView];
    [self setUpCropProportionView];
    [self clickProportionBtn: proportionBtnArr[0]];
    currentProportion = 0;

    
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}
- (void)setUpTKImageView {

    _tkImageView.backgroundColor = [UIColor clearColor];
    _tkImageView.toCropImage = _image;
    _tkImageView.showMidLines = YES;
    _tkImageView.needScaleCrop = YES;
    _tkImageView.showCrossLines = YES;
    _tkImageView.cornerBorderInImage = NO;
    _tkImageView.cropAreaCornerWidth = 44;
    _tkImageView.cropAreaCornerHeight = 44;
    _tkImageView.minSpace = 30;
    _tkImageView.cropAreaCornerLineColor = [UIColor whiteColor];
    _tkImageView.cropAreaBorderLineColor = [UIColor whiteColor];

    _tkImageView.cropAreaCornerLineWidth = 3;//四个角宽度
    _tkImageView.cropAreaBorderLineWidth = 1;//四周线


    // 中线
    _tkImageView.cropAreaMidLineWidth = 0;
    _tkImageView.cropAreaMidLineHeight = 0;


    _tkImageView.cropAreaMidLineColor = [UIColor whiteColor];
    _tkImageView.cropAreaCrossLineColor = [UIColor whiteColor];
    _tkImageView.cropAreaCrossLineWidth = 1;
    _tkImageView.initialScaleFactor = .8f;
    
}
- (void)setUpCropProportionView {
    
    proportionBtnArr = [NSMutableArray array];
    proportionImageNameArr = @[@"crop_free", @"crop_1_1", @"crop_4_3", @"crop_3_4", @"crop_16_9", @"crop_9_16"];
    proportionImageNameHLArr = @[@"cropHL_free", @"cropHL_1_1", @"cropHL_4_3", @"cropHL_3_4", @"cropHL_16_9", @"cropHL_9_16"];
    proportionArr = @[@0, @1, @(4.0/3.0), @(3.0/4.0), @(16.0/9.0), @(9.0/16.0)];
    self.cropProportionScrollView.contentSize = CGSizeMake(CROP_PROPORTION_IMAGE_PADDING * 2 + CROP_PROPORTION_IMAGE_WIDTH * proportionArr.count + CROP_PROPORTION_IMAGE_SPACE * (proportionArr.count - 1), CROP_PROPORTION_IMAGE_WIDTH);
    for(int i = 0; i < proportionArr.count; i++) {
        UIButton *proportionBtn = [[UIButton alloc]initWithFrame: CGRectMake(CROP_PROPORTION_IMAGE_PADDING + (CROP_PROPORTION_IMAGE_SPACE + CROP_PROPORTION_IMAGE_WIDTH) * i, 0, CROP_PROPORTION_IMAGE_WIDTH, CROP_PROPORTION_IMAGE_WIDTH)];
        [proportionBtn setBackgroundImage:
         [UIImage imageNamed: proportionImageNameArr[i]]
                                 forState: UIControlStateNormal];
        [proportionBtn setBackgroundImage:
         [UIImage imageNamed: proportionImageNameHLArr[i]]
                                 forState: UIControlStateSelected];
        [proportionBtn addTarget:self action:@selector(clickProportionBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.cropProportionScrollView addSubview:proportionBtn];
        [proportionBtnArr addObject:proportionBtn];
    }
    
}
- (void)clickProportionBtn: (UIButton *)proportionBtn {
    
    for(UIButton *btn in proportionBtnArr) {
        btn.selected = NO;
    }
    proportionBtn.selected = YES;
    NSInteger index = [proportionBtnArr indexOfObject:proportionBtn];
    currentProportion = [proportionArr[index] floatValue];
    _tkImageView.cropAspectRatio = currentProportion;
    
}
#pragma mark - IBActions
- (IBAction)clickCancelBtn:(id)sender
{
    
    [self.navigationController popViewControllerAnimated: YES];
    
}
- (IBAction)clickOkBtn:(id)sender
{
    
    UIImage *image =  [_tkImageView currentCroppedImage];


    if (self.blockValue) {

        self.blockValue(image);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)getValue:(BlockValue)aBlock {
    self.blockValue = aBlock;
}
@end
