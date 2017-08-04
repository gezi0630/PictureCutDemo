//
//  UIImage+Clicp.m
//  图片剪裁
//
//  Created by MAC on 2017/7/4.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

#import "UIImage+Clicp.h"

@implementation UIImage (Clicp)


/**
 裁剪一个带圆环的图片

 @param image 图片
 @param borderWidth 圆环宽度
 @param color 圆环颜色
 @return 裁剪完成的图片
 */
+(UIImage*)imageWithClipImage:(UIImage*)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor*)color
{
    //图片的高度和宽度
    CGFloat imageWH = image.size.width;
    //圆环的宽度
    CGFloat border = borderWidth;
    //大圆形的宽度和高度
    CGFloat ovalWH = imageWH + 2 * border;
  //1、开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalWH, ovalWH), NO, 0);
    //2、画大圆
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalWH, ovalWH)];
    [color set];
    
    [path fill];
    
    //3、设置剪裁区域（需先设置）
    UIBezierPath * clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, imageWH, imageWH)];
    [clipPath addClip];
    
    //4.绘制图片
    [image drawAtPoint:CGPointMake(border, border)];
    
    //5、获取图片
    UIImage * clipImage = UIGraphicsGetImageFromCurrentImageContext();
    //6、关闭上下文
    UIGraphicsEndImageContext();
    
    
    return clipImage;
}






@end
