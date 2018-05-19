//
//  AddTeacherVC.m
//  Zero
//
//  Created by 方涛 on 2018/4/25.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

// 宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define IOS8 ([[UIDevice currentDevice].systemVersion intValue] >= 8 ? YES : NO)
#define  Nav_Height         64

#import "AddTeacherVC.h"
#import <AVFoundation/AVFoundation.h>
#import "SDAutoLayout.h"
#import "cameraHelper.h"
#import <ZXingObjC/ZXingObjC.h>

#define KDeviceFrame [UIScreen mainScreen].bounds

static const float kLineMinY = 185;


@interface AddTeacherVC ()<AVCaptureMetadataOutputObjectsDelegate,UIImagePickerControllerDelegate>

@property(nonatomic,strong)UIImageView *imageView;
@property (nonatomic, strong) AVCaptureSession *qrSession;//回话
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *qrVideoPreviewLayer;//读取
@property (nonatomic, strong) UIImageView *line;//交互线
@property (nonatomic, strong) NSTimer *lineTimer;//交互线控制

@property(nonatomic)BOOL isLight;


@end

@implementation AddTeacherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navTitle = @"扫描绑定教师";
    [self initUI];
    [self setOverlayPickerView];
    [self startReading];
}
- (AVCaptureDevice *)cameraWithPosition:(AVCaptureDevicePosition)position
{
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices )
        if ( device.position == position )
            return device;
    return nil;
}
- (void)initUI{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"" message:@"请在iPhone的“设置”-“隐私”-“相机”功能中，找到打开相机访问权限" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //摄像头判断
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (error){
        NSLog(@"没有摄像头-%@", error.localizedDescription);
        [self dismissViewControllerAnimated:YES completion:nil];
        
        return;
    }
    //设置输出(Metadata元数据)
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    //设置输出的代理
    //使用主线程队列，相应比较同步，使用其他队列，相应不同步，容易让用户产生不好的体验
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [output setRectOfInterest:[self getReaderViewBoundsWithSize:CGSizeMake(SCREEN_WIDTH-140, SCREEN_WIDTH-140)]];
    
    //拍摄会话
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    [session setSessionPreset:AVCaptureSessionPresetHigh];
    
    
    if ([session canAddInput:input]){
        [session addInput:input];
    }
    
    if ([session canAddOutput:output]){
        [session addOutput:output];
    }
    
    //设置输出的格式
    //一定要先设置会话的输出为output之后，再指定输出的元数据类型
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeCode128Code,AVMetadataObjectTypeEAN8Code,AVMetadataObjectTypeUPCECode,AVMetadataObjectTypeCode39Code,AVMetadataObjectTypePDF417Code,AVMetadataObjectTypeAztecCode,AVMetadataObjectTypeCode93Code,AVMetadataObjectTypeEAN13Code,AVMetadataObjectTypeCode39Mod43Code]];
    
    //设置预览图层
    AVCaptureVideoPreviewLayer *preview = [AVCaptureVideoPreviewLayer layerWithSession:session];
    
    //设置preview图层的属性
    [preview setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    //设置preview图层的大小
    preview.frame = self.view.layer.bounds;
    
    //将图层添加到视图的图层
    [self.view.layer insertSublayer:preview atIndex:0];
    //[self.view.layer addSublayer:preview];
    self.qrVideoPreviewLayer = preview;
    self.qrSession = session;
}

- (CGRect)getReaderViewBoundsWithSize:(CGSize)asize{
    
    return CGRectMake(kLineMinY / SCREEN_HEIGHT, ((SCREEN_WIDTH - asize.width) / 2.0) / SCREEN_WIDTH, asize.height / SCREEN_HEIGHT, asize.width / SCREEN_WIDTH);
}

- (void)setOverlayPickerView{
    
    //画中间的基准线
    _line = [[UIImageView alloc] initWithFrame:CGRectMake(70,64+150,SCREEN_WIDTH - 140, 8)];
    [_line setImage:[UIImage imageNamed:@"scanImage-1"]];
    [self.view addSubview:_line];
    
    //最上部view
    UIView* upView = [[UIView alloc]init];
    [self.view addSubview:upView];
    upView.sd_layout.topSpaceToView(self.view,Nav_Height).leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).heightIs(150);
    upView.alpha = 0.3;
    upView.backgroundColor = [UIColor blackColor];
    
    //左侧的view
    UIView *leftView = [[UIView alloc] init];
    [self.view addSubview:leftView];
    leftView.sd_layout.topSpaceToView(upView,0).leftSpaceToView(self.view,0).bottomSpaceToView(self.view,0).widthIs(70);
    leftView.alpha = 0.3;
    leftView.backgroundColor = [UIColor blackColor];
    
    //右侧的view
    UIView *rightView = [[UIView alloc] init];
    [self.view addSubview:rightView];
    rightView.sd_layout.topSpaceToView(upView,0).rightSpaceToView(self.view,0).bottomSpaceToView(self.view,0).widthIs(70);
    rightView.alpha = 0.3;
    rightView.backgroundColor = [UIColor blackColor];
    
    //扫描区域
    UIView *scanCropView = [[UIView alloc] initWithFrame:CGRectMake(60,64+150,SCREEN_WIDTH - 120, SCREEN_WIDTH - 140)];
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(70-3,64+150-3,SCREEN_WIDTH-140+4, SCREEN_WIDTH-140+4)];
    self.imageView.image = [UIImage imageNamed:@"scanImage"];
    
    [self.view addSubview:scanCropView];
    [self.view addSubview:self.imageView];
    //底部view
    UIView *downView = [[UIView alloc] init];
    [self.view addSubview:downView];
    downView.sd_layout.topSpaceToView(scanCropView,0).leftSpaceToView(leftView,0).bottomSpaceToView(self.view,0).rightSpaceToView(rightView,0);
    downView.alpha = 0.3;
    downView.backgroundColor = [UIColor blackColor];
    
    //说明label
    UILabel *labIntroudction = [[UILabel alloc] init];
    [self.view addSubview:labIntroudction];
    labIntroudction.sd_layout.topSpaceToView(scanCropView, 20).leftSpaceToView(leftView,0).heightIs(44).rightSpaceToView(rightView,0);
    labIntroudction.font=[UIFont systemFontOfSize:12];
    labIntroudction.backgroundColor = [UIColor clearColor];
    labIntroudction.textAlignment = NSTextAlignmentCenter;
    labIntroudction.textColor = [UIColor whiteColor];
    labIntroudction.text = @"请将二维码图案放置在取景框内";
    labIntroudction.adjustsFontSizeToFitWidth =YES;
    //    开启闪光灯
    UIButton *light=[UIButton buttonWithTitle:@"" withImageName:@"ico_shanguang" withBGColor:nil Withlayer:NO];
    [self.view addSubview:light];
    [light mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-30);
        make.bottom.equalTo(scanCropView.mas_top).offset(-50);
        make.width.height.equalTo(light);
    }];
    [light addTarget:self action:@selector(lightClick:) forControlEvents:UIControlEventTouchUpInside];
    self.isLight = NO;
    
    
    UIButton *photoBtn=[UIButton buttonWithTitle:@"" withImageName:@"ico_anniu_bdxc" withBGColor:nil Withlayer:NO];
    [self.view addSubview:photoBtn];
    [photoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(labIntroudction.mas_bottom).offset(30);
        make.width.equalTo(photoBtn);
        make.height.equalTo(photoBtn);
      
    }];
    [photoBtn addTarget:self action:@selector(photoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)lightClick:(UIButton *)light{
    
    Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
    if (captureDeviceClass != nil) {
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch] && [device hasFlash]){
            
            [device lockForConfiguration:nil];
            if (self.isLight ==NO) {
                [device setTorchMode:AVCaptureTorchModeOn];
                [device setFlashMode:AVCaptureFlashModeOn];//
                self.isLight  = YES;
                [light setImage:[UIImage imageNamed:@"ico_shanguang_s"] forState:UIControlStateNormal];
                
            } else {
                [device setTorchMode:AVCaptureTorchModeOff];
                [device setFlashMode:AVCaptureFlashModeOff];
                self.isLight  = NO;
                [light setImage:[UIImage imageNamed:@"ico_shanguang"] forState:UIControlStateNormal];
                
            }
            [device unlockForConfiguration];
        }
    }
    
}


-(void)right_button_event:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 相册
- (void)clickToImagePicker{
    
}

#pragma mark 输出代理方法
//此方法是在识别到QRCode，并且完成转换
//如果QRCode的内容越大，转换需要的时间就越长
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    //扫描结果
    if (metadataObjects.count > 0){
        [self stopSYQRCodeReading];
        AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
        
        
        if (obj.stringValue.length) {
            
            NSDictionary *dic = [obj.stringValue mj_JSONObject];
            if (self.ScanSuncessBlock) {
                self.ScanSuncessBlock(self,obj.stringValue);
                
            }else if ([obj.stringValue rangeOfString:@"http"].location != NSNotFound){
                
                [self.navigationController popViewControllerAnimated:NO];
                
                [[UIApplication sharedApplication]openURL:[NSURL URLWithString:obj.stringValue]];
                
            }else{
                [self.navigationController popViewControllerAnimated:YES];
                [SVProgressHUD showErrorWithStatus:@"二维码无效"];
                return;
            }
        }else{
            [self.navigationController popViewControllerAnimated:YES];
            [SVProgressHUD showErrorWithStatus:@"二维码无效"];
            return;
        }
    }else{
        [self.navigationController popViewControllerAnimated:YES];
        [SVProgressHUD showErrorWithStatus:@"二维码无效"];
        return;
    }
}
#pragma mark 交互事件
- (void)startReading
{
    _lineTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 / 20 target:self selector:@selector(animationLine) userInfo:nil repeats:YES];
    
    [self.qrSession startRunning];
    
    NSLog(@"start reading");
}


- (void)stopSYQRCodeReading
{
    if (_lineTimer)
    {
        [_lineTimer invalidate];
        _lineTimer = nil;
    }
    
    [self.qrSession stopRunning];
    
    NSLog(@"stop reading");
}


#pragma mark 上下滚动交互线
- (void)animationLine{
    
    __block CGRect frame = _line.frame;
    
    static BOOL flag = YES;
    if (flag){
        
        frame.origin.y = Nav_Height+150;
        flag = NO;
        [UIView animateWithDuration:1.0 / 20 animations:^{
            
            frame.origin.y += 5;
            _line.frame = frame;
        }];
    }else{
        if (_line.frame.origin.y >= Nav_Height+150){
            if (_line.frame.origin.y >= Nav_Height+150+SCREEN_WIDTH - 140 - 12){
                frame.origin.y = Nav_Height+150;
                _line.frame = frame;
                
                flag = YES;
            }else{
                [UIView animateWithDuration:1.0 / 20 animations:^{
                    
                    frame.origin.y += 5;
                    _line.frame = frame;
                    
                }];
            }
        }else{
            flag = !flag;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    //摄像头判断
    NSError *error = nil;
    
    if (error){
        // NSLog(@"没有摄像头-%@", error.localizedDescription);
        [self dismissViewControllerAnimated:YES completion:nil];
        
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"没有相机权限，请在设置里面打开" preferredStyle:UIAlertControllerStyleAlert];
        
        [ac addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
        
        [self presentViewController:ac animated:YES completion:nil];
        
        return;
    }
    
    
}
-(void)photoBtnClick:(UIButton*)sender{
    [self stopSYQRCodeReading];
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
    }
    if ([cameraHelper checkCameraAuthorizationStatus]) {
        UIImagePickerController *imagePicker = [UIImagePickerController new];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
  
}
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    // 使用 CIDetector 处理 图片
    UIImage *QRCodeImage = info[UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:^{
        [self getURLWithImage:QRCodeImage];
    }];
 

}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}
     

-(void)getURLWithImage:(UIImage *)img{

         UIImage *loadImage= img;
         CGImageRef imageToDecode = loadImage.CGImage;

         ZXLuminanceSource *source = [[ZXCGImageLuminanceSource alloc] initWithCGImage:imageToDecode];
         ZXBinaryBitmap *bitmap = [ZXBinaryBitmap binaryBitmapWithBinarizer:[ZXHybridBinarizer binarizerWithSource:source]];

         NSError *error = nil;

         ZXDecodeHints *hints = [ZXDecodeHints hints];

         ZXMultiFormatReader *reader = [ZXMultiFormatReader reader];
         ZXResult *result = [reader decode:bitmap
                                     hints:hints
                                     error:&error];
         if (result) {
             // The coded result as a string. The raw data can be accessed with
             // result.rawBytes and result.length.
             NSString *contents = result.text;
             NSLog(@"contents =%@",contents);
             UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"解析成功" message:contents delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
             [alter show];

         } else {
             UIAlertView *alter1 = [[UIAlertView alloc] initWithTitle:@"解析失败" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
             [alter1 show];
         }
    
}

@end


