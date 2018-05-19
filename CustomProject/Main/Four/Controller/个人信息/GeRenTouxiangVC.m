//
//  GeRenTouxiangVC.m
//  Zero
//
//  Created by zf on 2018/4/25.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "GeRenTouxiangVC.h"
#import "CropImageViewController.h"
#import "XiuGaiViewController.h"
@interface GeRenTouxiangVC ()<UIImagePickerControllerDelegate>
@property (nonatomic, strong) UIImageView * headerImageView;
@end

@implementation GeRenTouxiangVC
-(UIImageView *)headerImageView
{
    if (!_headerImageView)
    {
        _headerImageView = [[UIImageView alloc]init];
    }
    return _headerImageView;
}
#pragma mark - UIImagePickerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {

    UIImage *toCropImage = info[UIImagePickerControllerOriginalImage];
    [self cropImage: toCropImage];
    [picker dismissViewControllerAnimated: YES completion: NULL];

}
- (void)cropImage: (UIImage *)image {

    CropImageViewController *cropImageViewController = [[CropImageViewController alloc]initWithNibName:@"CropImageViewController" bundle:nil];

    cropImageViewController.image = image;
    [cropImageViewController setBlockValue:^(UIImage *image) {

        self.headerImageView.image = image;
    }];

    [self.navigationController pushViewController: cropImageViewController animated: YES];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titleLabel.text = @"个人头像";
    [self.navRightBtn setImage:[UIImage imageNamed:@"ico_tongzhi_faxian"] forState:0];

    [self.navRightBtn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {

        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                 delegate:self
                                                        cancelButtonTitle:@"取消"
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:@"拍照",@"从手机相册选择",nil];
        [actionSheet showInView:self.view];

    }];
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:@""]placeholderImage:[UIImage imageNamed:@"ico_touxiang_wode"]];

    [self.view addSubview:self.headerImageView];


    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.height.equalTo(@(kMainScreen_width));
    }];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonInde
{
    switch (buttonInde) {
        case 0:

        {

            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;

            imagePicker.sourceType = sourceType;
            imagePicker.delegate = self;
            [self presentViewController: imagePicker animated:YES completion: NULL];
        }

            break;
        case 1:
        {

            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.navigationBar.translucent = NO;
            imagePicker.sourceType = sourceType;
            imagePicker.delegate = self;
            [self presentViewController: imagePicker animated:YES completion: NULL];
        }
            break;


        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}


@end
