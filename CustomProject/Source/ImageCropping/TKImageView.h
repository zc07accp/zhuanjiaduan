//
//  TKImageView.h
//  TKImageDemo
//
//  Created by yinyu on 16/7/10.
//  Copyright © 2016年 yinyu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, TKCropAreaCornerStyle) {
    TKCropAreaCornerStyleRightAngle,
    TKCropAreaCornerStyleCircle
};
@interface TKImageView : UIView
@property (strong, nonatomic) UIImage *toCropImage;
@property (assign, nonatomic) BOOL needScaleCrop;
@property (assign, nonatomic) BOOL showMidLines;
@property (assign, nonatomic) BOOL showCrossLines;
@property (assign, nonatomic) CGFloat cropAspectRatio;
@property (strong, nonatomic) UIColor *cropAreaBorderLineColor;
@property (assign, nonatomic) CGFloat cropAreaBorderLineWidth;
@property (strong, nonatomic) UIColor *cropAreaCornerLineColor;
@property (assign, nonatomic) CGFloat cropAreaCornerLineWidth;
@property (assign, nonatomic) CGFloat cropAreaCornerWidth;
@property (assign, nonatomic) CGFloat cropAreaCornerHeight;
@property (assign, nonatomic) CGFloat minSpace;
@property (assign, nonatomic) CGFloat cropAreaCrossLineWidth;
@property (strong, nonatomic) UIColor *cropAreaCrossLineColor;
@property (assign, nonatomic) CGFloat cropAreaMidLineWidth;
@property (assign, nonatomic) CGFloat cropAreaMidLineHeight;
@property (strong, nonatomic) UIColor *cropAreaMidLineColor;
@property (strong, nonatomic) UIColor *maskColor;
@property (assign, nonatomic) BOOL cornerBorderInImage;
@property (assign, nonatomic) CGFloat initialScaleFactor;
- (UIImage *)currentCroppedImage;
@end
//name    type    description
//toCropImage    UIImage    待裁剪的图片。
//The image you want to crop.
//needScaleCrop    BOOL    是否需要缩放裁剪。
//Determines whether you need to scale crop with pinch gesture or not.
//showMidLines    BOOL    是否需要显示每条边中间的线，这条中间线支持拖动手势。
//Show the lines in the middle of each border, which can receive pan gesture to resize the crop area when the aspect ratio is ZERO.
//showCrossLines    BOOL    是否显示裁剪框内的交叉线。
//Show the cross lines in the crop area.
//cropAspectRatio    CGFloat    设置裁剪框的宽高比。
//The aspect retio you want to crop the image, equals to WIDTH / HEIGHT.
//cropAreaBorderLineColor    UIColor    设置裁剪边框的颜色。
//The color of border lines.
//cropAreaBorderLineWidth    CGFloat    设置裁剪边框的线宽。
//The width of border lines.
//cropAreaCornerLineColor    UIColor    设置裁剪边框四个角的颜色。
//The line color of the corner.
//cropAreaCornerLineWidth    CGFloat    设置裁剪边框四个角的线宽。
//The line width of the corner.
//cropAreaCornerWidth    CGFloat    设置裁剪边框四个角的宽度，这里指角的横边的长度。
//The width of the corner area, indicate the length of the horizontal line of the corner.
//cropAreaCornerHeight    CGFloat    设置裁剪边框四个角的高度，这里指角的竖边的长度。
//The height of the corner area, indicate the length of the vertical line of the corner.
//minspace    CGFloat    相邻角之间的最小距离。
//The minimum distance between the corners.
//cropAreaCrossLineWidth    CGFloat    裁剪框内交叉线的宽度。
//The width of cross lines.
//cropAreaCrossLineColor    UIColor    裁剪框内交叉线的颜色。
//The color of cross lines.
//cropAreaMidLineWidth    CGFloat    裁剪边框每条边中间线的长度。
//The width of middle lines.
//cropAreaMidLineHeight    CGFloat    裁剪边框每条边中间线的线宽。
//The height of middle lines.
//cropAreaMidLineColor    UIColor    裁剪边框每条边中间线的颜色。
//The color of middle lines.
//maskColor    UIColor    裁剪区域的蒙板颜色。
//The color of the mask view which is always transparent black.
//cornerBorderInImage    BOOL    裁剪边框的四个角是否可以超出图片显示。
//Whether the corner border inside the image or not.
