//
//  ViewController.h
//  UITextField控件的使用
//
//  Created by GnuHua on 14-7-30.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import <UIKit/UIKit.h>

// 添加UITextFieldDelegate协议，使用协议中的textFieldReturn方法，完成textField修改后，隐藏键盘的功能。
@interface ViewController : UIViewController<UITextFieldDelegate>

@end
