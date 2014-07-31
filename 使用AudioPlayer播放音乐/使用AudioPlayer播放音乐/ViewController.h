//
//  ViewController.h
//  使用AudioPlayer播放音乐
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import <UIKit/UIKit.h>

// AVFoundation是个非常cool的框架。它能收集各种多媒体数据，这些数据可以来自不同的输入设备，比如摄像机，录音机等。
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

// 创建一个AVAudioPlayer变量，AVAudioPlayer是一个容易使用而且功能强大，基于Object-c的播放音频文件播放器。
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end
