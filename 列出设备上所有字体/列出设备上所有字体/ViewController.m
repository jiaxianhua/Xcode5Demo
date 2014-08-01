//
//  ViewController.m
//  列出设备上所有字体
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

    // 遍历设备字体。
    for (NSString *family in [UIFont familyNames])
    {
        NSLog(@"family name : %@", family);
        // 遍历字体组中所有字体。
        for (NSString *font in [UIFont fontNamesForFamilyName:family])
        {
            NSLog(@"\t %@", font);
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
