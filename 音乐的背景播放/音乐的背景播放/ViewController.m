//
//  ViewController.m
//  音乐的背景播放
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // AVAudioSession是一个单例模式，也就是说不用开发都自行实例化。这个类在各种音频环境中起着非常重要的作用。
    AVAudioSession *session = [AVAudioSession sharedInstance];
    // 启动音频会话管理，此时会阻断后台音乐的播放。
    [session setActive:YES error:nil];
    // 设置音频操作类别，表示该应用仅支持播放。
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    
    NSString *musicPath = [[NSBundle mainBundle] pathForResource:@"love" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:musicPath];
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [_audioPlayer prepareToPlay];
    [_audioPlayer setVolume:1];
    _audioPlayer.numberOfLoops = -1;
    [_audioPlayer play];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
