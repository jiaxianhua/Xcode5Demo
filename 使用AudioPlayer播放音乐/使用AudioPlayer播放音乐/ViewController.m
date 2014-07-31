//
//  ViewController.m
//  使用AudioPlayer播放音乐
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
    _audioPlayer.numberOfLoops = -1;
    
    if (_audioPlayer == nil)
    {
        NSLog(@"%@", [error description]);
    }
    else
    {
        [_audioPlayer play];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
