//
//  ViewController.m
//  简单的视频播放器
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
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"movie" withExtension:@"mov"];
    
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    // 自动播放。
    self.player.shouldAutoplay = YES;
    
    // 设置播放器的大小 16:9是主流媒体的样式
    [self.player.view setFrame:CGRectMake(0, 0, 320, 180)];
    // 将播放器视图添加到根视图
    [self.view addSubview:self.player.view];
    
    // 1 监听播放状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stateChange) name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
    // 2 监听播放完成
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishedPlay) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    // 3 视频截图
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(caputerImage:) name:MPMoviePlayerThumbnailImageRequestDidFinishNotification object:nil];
    
    // 4 退出全屏通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(exitFullScreen) name:MPMoviePlayerDidExitFullscreenNotification object:nil];
    
    // 异步视频截图,可以在attimes指定一个或者多个时间。
    [self.player requestThumbnailImagesAtTimes:@[@10.0f, @20.0f] timeOption:MPMovieTimeOptionNearestKeyFrame];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(80, 200, 160, 90)];
    [self.view addSubview:self.imageView];
}

#pragma mark 退出全屏
- (void)exitFullScreen
{
    NSString *information = @"退出全屏";
    NSLog(@"%@", information);
}

#pragma mark - 播放器事件监听
#pragma mark 视频截图 这个方法是异步方法
- (void)caputerImage:(NSNotification *)notification
{
    NSString *information = [NSString stringWithFormat:@"截图 %@", notification];
    NSLog(@"%@", information);
    UIImage *image = notification.userInfo[@"MPMoviePlayerThumbnailImageKey"];
    [self.imageView setImage:image];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Information" message:information delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark 播放完成
- (void)finishedPlay
{
    NSString *information = @"播放完成";
    NSLog(@"%@", information);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Information" message:information delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark 播放状态变化
/*
 MPMoviePlaybackStateStopped,  //停止
 MPMoviePlaybackStatePlaying,  //播放
 MPMoviePlaybackStatePaused,   //暂停
 MPMoviePlaybackStateInterrupted,  //中断
 MPMoviePlaybackStateSeekingForward, //快进
 MPMoviePlaybackStateSeekingBackward  //快退
 */
- (void)stateChange
{
    NSString *information;
    
    switch (self.player.playbackState)
    {
        case MPMoviePlaybackStatePaused:
            information = @"暂停";
            break;
        case MPMoviePlaybackStatePlaying:
            //设置全屏播放
            [self.player setFullscreen:YES animated:YES];
            information = @"播放";
            break;
        case MPMoviePlaybackStateStopped:
            //注意：正常播放完成，是不会触发MPMoviePlaybackStateStopped事件的。
            //调用[self.player stop];方法可以触发此事件。
            information = @"停止";
            break;
        default:
            break;
    }
    
    NSLog(@"%@", information);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Information" message:information delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
