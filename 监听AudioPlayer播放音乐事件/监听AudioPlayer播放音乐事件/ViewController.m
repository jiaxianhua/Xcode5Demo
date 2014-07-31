//
//  ViewController.m
//  监听AudioPlayer播放音乐事件
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
    
    // 定义声音文件的真实路径。
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/love.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    NSError *error;
    // 初始化AVAudioPlayer变量。
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    // 设置声音播放次数， -1为无限循环播放。
    _audioPlayer.numberOfLoops = 1;
    _audioPlayer.volume = 0.8;
    // AVAudioPlayer变量设定代理对象。
    _audioPlayer.delegate = self;
    
    if (_audioPlayer == nil)
    {
        NSLog(@"%@", [error description]);
    }
    else
    {
        [_audioPlayer play];
    }
}

#pragma mark - 添加一个代理方法，用来监听声音播放的事件。
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

#pragma mark - 用来监听声音文件解析错误的事件。
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

#pragma mark - 用来监听播放声音中断的事件。
- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
