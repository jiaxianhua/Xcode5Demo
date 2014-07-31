//
//  ViewController.m
//  使用MPMoviePlayerController播放影片
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
    
    // 定义视频文件在项目中的路径。
    NSString *path = [[NSBundle mainBundle] pathForResource:@"movie" ofType:@"mov"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    // 初始化视频播放控制器组件。
    _movie = [[MPMoviePlayerController alloc] initWithContentURL:url];
    // 设置亮叔播放模式为全屏播放。
    _movie.controlStyle = MPMovieControlStyleFullscreen;
    // 设置视频播放窗口大小。
    [_movie.view setFrame:self.view.bounds];
    // 使用initialPlaybackTime函数，设置播放的开始时间。
    _movie.initialPlaybackTime = -1;
    
    [self.view addSubview:_movie.view];
    
    // 添加一个通知，用来监听视频播放是否结束。
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(myMovieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:_movie];
    // 开始播放视频。
    [_movie play];
}

#pragma mark - 创建一个方法，用来处理视频播放结束事件。
- (void)myMovieFinishedCallback:(NSNotification *)notify
{
    // 获得视频播放控制器。
    MPMoviePlayerController *theMovie = [notify object];
    // 取消通知的监听，释放资源。
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:theMovie];
    [theMovie.view removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
