//
//  TQStatusBarHUD.m
//  002-新闻详情界面
//
//  Created by 谭淇 on 15-1-26.
//  Copyright (c) 2015年 tanqi. All rights reserved.
//

#import "TQStatusBarHUD.h"

#define kTextColor [UIColor whiteColor]
/** 窗口的高度 */
#define kWindowHeight 20
/** 动画执行的时间 */
#define kanimationDuration 0.5
/** 窗口停留的时间 */
#define kanimationDelay 1.25
/** 文字字体 */
#define kFont [UIFont systemFontOfSize:12]

@implementation TQStatusBarHUD
// 全局变量
UIWindow *_window = nil;

/**
 * 显示指定信息
 * @param msg 信息
 * @param image 要显示的图片（图片高度最好在20以内）
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    if (_window) return;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:kTextColor forState:UIControlStateNormal];
    btn.titleLabel.font = kFont;
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    
    // 设置数据
    [btn setTitle:msg forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    
    // 获得自定义窗口
    _window = [[UIWindow alloc] init];
    _window.backgroundColor = [UIColor blackColor];
    _window.frame = CGRectMake(0, -kWindowHeight, [UIScreen mainScreen].bounds.size.width, kWindowHeight);
    // UIWindowLevelAlert > UIWindowLevelStatus > UIWindowLevelNormal
    // 状态栏也是一个window
    _window.windowLevel = UIWindowLevelAlert;
    
    btn.frame = _window.bounds;
    [_window addSubview:btn];
    
    // 显示窗口
    _window.hidden = NO;
    
    // 动画
    [UIView animateWithDuration:kanimationDuration animations:^{
        _window.transform = CGAffineTransformMakeTranslation(0, kWindowHeight);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:kanimationDuration delay:kanimationDelay options:kNilOptions animations:^{
            _window.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            // 直接设为nil就可以移除window了
            _window = nil;
        }];
    }];
    
}

/**
 * 显示指定信息
 * @param msg 信息
 * @param imageName 要显示的图片的名字（图片高度最好在20以内, 仅限于本地图片）
 */
+ (void)showMessage:(NSString *)msg imageName:(NSString *)imageName
{
    [self showMessage:msg image:[UIImage imageNamed:imageName]];
}

/**
 * 显示成功信息
 * @param msg 信息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg imageName:@"TQStatusBarHUD.bundle/success"];
}

/**
 * 显示失败信息
 * @param msg 信息
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg imageName:@"TQStatusBarHUD.bundle/error"];
}

/**
 * 显示加载信息
 * @param msg 信息
 */
+ (void)showLoading:(NSString *)msg
{
    if (_window) return;
    
    CGFloat SW = [UIScreen mainScreen].bounds.size.width;
    
    _window = [[UIWindow alloc] init];
    _window.backgroundColor = [UIColor blackColor];
    _window.windowLevel = UIWindowLevelAlert;
    _window.frame = CGRectMake(0, -kWindowHeight, SW, kWindowHeight);
    _window.hidden = NO;
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [indicatorView startAnimating];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = msg;
    label.font = kFont;
    label.textColor = kTextColor;
    [label sizeToFit];
    label.center = CGPointMake(SW * 0.5, kWindowHeight * 0.5);
    CGFloat labelWidth = label.bounds.size.width;
    [_window addSubview:label];
    
    CGFloat x = (SW - labelWidth) * 0.5 - 5 - kWindowHeight;
    indicatorView.frame = CGRectMake(x, 1, kWindowHeight, kWindowHeight);
    [_window addSubview:indicatorView];
    
    [UIView animateWithDuration:kanimationDuration animations:^{
        _window.transform = CGAffineTransformMakeTranslation(0, kWindowHeight);
    }];
}

/**
 * 隐藏加载信息
 */
+ (void)hideLoading
{
    [UIView animateWithDuration:kanimationDuration animations:^{
        _window.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        _window = nil;
    }];
}

@end
