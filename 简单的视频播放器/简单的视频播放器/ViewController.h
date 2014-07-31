//
//  ViewController.h
//  简单的视频播放器
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) MPMoviePlayerController *player;
@property (nonatomic, strong) UIImageView *imageView;

@end
