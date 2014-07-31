//
//  ViewController.m
//  使用SystemSoundId播放简短声音
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()

@end

#pragma mark - 对于按键音，下拉菜单音等，对于这些短时间的声音还有震动，用System Sound Services 来实现播放是最方便的。

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 声明一个SystemSoundID类型的声音变量。
    SystemSoundID soundID;
    // 通过NSBundle的mainBundle方法返回一个NSBundle对象，该对象对应当前应用程序可执行二进制所属目录。
    NSURL *soundUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"dog" ofType:@"mp3"]];
    // (__bridge CFURLRef)是强制转换成CFURLRef对象，固为此处理要将一个c语言的结构转换为Objective-c对象，所以必须加birdge.
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundUrl, &soundID);
    // 播放声音。
    AudioServicesPlayAlertSound(soundID);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
