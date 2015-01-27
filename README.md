## TQStatusBarHUD
 这是一个简单的状态栏指示器
 
## 如何使用？
* 将`TQStatusBarHUD`文件夹导入项目中；
* 导入主头文件：`#import "TQStatusBarHUD.h"`。

### 显示成功信息
```objc
[TQStatusBarHUD showSuccess:@"下载成功！"];
```
### 显示失败信息
```objc
[TQStatusBarHUD showError:@"下载失败！"];
```
### 显示加载中信息
```objc
[TQStatusBarHUD showLoading:@"下载中.."];
```
### 显示加载中消失信息
```objc
[TQStatusBarHUD hideLoading];
```
### 自定义文字和图片显示片（ps: 大小有一定限制）
```objc
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
```
