//
//  ViewController.h
//  使用MPMoviePlayerController播放影片
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - MediaPlayer框架，允许你访问音频和视频。它管理整个页面的音频或视频播放器，无需你控制其如何工作，但是让你很容易访问音频或视频文件。
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) MPMoviePlayerController *movie;

@end
