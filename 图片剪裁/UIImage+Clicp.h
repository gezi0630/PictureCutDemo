//
//  UIImage+Clicp.h
//  图片剪裁
//
//  Created by MAC on 2017/7/4.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Clicp)

+(UIImage*)imageWithClipImage:(UIImage*)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor*)color;


@end
