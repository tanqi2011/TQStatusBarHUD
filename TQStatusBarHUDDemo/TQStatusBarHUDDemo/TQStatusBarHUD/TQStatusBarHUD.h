//
//  TQStatusBarHUD.h
//  002-新闻详情界面
//
//  Created by 谭淇 on 15-1-26.
//  Copyright (c) 2015年 tanqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TQStatusBarHUD : NSObject
/**
 * 显示指定信息
 * @param msg 信息
 * @param image 要显示的图片（图片高度最好在20以内）
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 * 显示指定信息
 * @param msg 信息
 * @param imageName 要显示的图片的名字（图片高度最好在20以内, 仅限于本地图片）
  NS_DEPRECATED_IOS(2_0, 3_0, "请使用+ (void)showMessage:(NSString *)msg image:(UIImage *)image;方法")
 */
+ (void)showMessage:(NSString *)msg imageName:(NSString *)imageName;

/**
 * 显示成功信息
 * @param msg 信息
 */
+ (void)showSuccess:(NSString *)msg;

/**
 * 显示失败信息
 * @param msg 信息
 */
+ (void)showError:(NSString *)msg;

/**
 * 显示加载信息
 * @param msg 信息
 */
+ (void)showLoading:(NSString *)msg;

/**
 * 隐藏加载信息
 */
+ (void)hideLoading;

@end
