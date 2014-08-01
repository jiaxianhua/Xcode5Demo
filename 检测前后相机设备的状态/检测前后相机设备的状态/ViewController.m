//
//  ViewController.m
//  检测前后相机设备的状态
//
//  Created by GnuHua on 14-8-1.
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

    // 检测设备的后摄像头是否可用。
    BOOL cameraAvailable = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    // 检测设备的前摄像头是否可用。
    BOOL frontCameraAvailable = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];

    NSLog(@"------cameraAvailable:%d", cameraAvailable);
    NSLog(@"------frontCameraAvailable:%d", frontCameraAvailable);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
