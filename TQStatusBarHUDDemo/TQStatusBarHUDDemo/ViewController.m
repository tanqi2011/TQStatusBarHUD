//
//  ViewController.m
//  TQStatusBarHUDDemo
//
//  Created by 谭淇 on 15-1-27.
//  Copyright (c) 2015年 tanqi. All rights reserved.
//

#import "ViewController.h"
#import "TQStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)showSeccess:(UIButton *)sender {
    [TQStatusBarHUD showSuccess:@"下载成功！"];
}

- (IBAction)showError:(UIButton *)sender {
    [TQStatusBarHUD showError:@"下载失败！"];
}

- (IBAction)downloading:(UIButton *)sender {
    [TQStatusBarHUD showLoading:@"下载中.."];
}

- (IBAction)downloadDone:(UIButton *)sender {
    [TQStatusBarHUD hideLoading];
}
@end
