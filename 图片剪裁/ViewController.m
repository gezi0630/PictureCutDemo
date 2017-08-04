//
//  ViewController.m
//  图片剪裁
//
//  Created by MAC on 2017/7/4.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Clicp.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self clipCircleBorder];
    
    [self clicp];
    
}

#pragma mark - 裁剪出一个带环的圆图片
-(void)clipCircleBorder
{
    UIImage * image = [UIImage imageNamed:@"阿狸"];
    
    
    UIImage * imageNew = [UIImage imageWithClipImage: image borderWidth:2 borderColor:[UIColor redColor]];
    
    self.imageView.image = imageNew;

}


#pragma mark - 裁剪出一个圆形图片
-(void)clicp
{
    //0 加载图片
    UIImage * image = [UIImage imageNamed:@"阿狸"];
    //1 开启位图上下文，跟图片尺寸一样大
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //2 设置圆形裁剪区域（改动此方法可改变裁剪形状）
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //3 把路径设置为剪裁区域
    [path addClip];
    //3 绘制图片
    [image drawAtPoint:CGPointZero];
    //4 从上下文中获取图片
    UIImage * imageNew = UIGraphicsGetImageFromCurrentImageContext();
    //5 关闭上下文
    UIGraphicsEndImageContext();
    
    self.imageView.image = imageNew;

}


@end
