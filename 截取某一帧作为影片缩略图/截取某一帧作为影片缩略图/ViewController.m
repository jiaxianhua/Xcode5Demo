//
//  ViewController.m
//  截取某一帧作为影片缩略图
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *str = [[NSBundle mainBundle] pathForResource:@"movie" ofType:@"mov"];
    
    [self getThumbnailFromMovie:str];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    
    [self.view addSubview:self.imageView ];
}

#pragma mark - 新建一个方法，传递一个视频路径参数，用来实现从视频中抽取某个时间点做视频缩略图的功能。
- (void)getThumbnailFromMovie:(NSString *)moviePath
{
    NSURL *url = [NSURL fileURLWithPath:moviePath];
    // 初始化视频控制器对象。
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    // 禁止自动播放。
    self.player.shouldAutoplay = NO;
    // 添加视频截图通知。
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(caputerImage:) name:MPMoviePlayerThumbnailImageRequestDidFinishNotification object:nil];
    
    // 异步视频截图，可以在Attimes指定一个或者多个时间。
    [self.player requestThumbnailImagesAtTimes:@[@10.0f, @20.0f] timeOption:MPMovieTimeOptionNearestKeyFrame];
}

#pragma mark - 播放器事件监听
#pragma mark 视频截图 这个方法是异步方法
- (void)caputerImage:(NSNotification *)notification
{
    NSLog(@"截图 %@", notification);
    UIImage *image = notification.userInfo[@"MPMoviePlayerThumbnailImageKey"];
    [self.imageView setImage:image];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
