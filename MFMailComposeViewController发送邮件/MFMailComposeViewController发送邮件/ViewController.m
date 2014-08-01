   //
//  ViewController.m
//  MFMailComposeViewController发送邮件
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
    
    CGRect rect = CGRectMake(84, 150, 150, 50);
    // 添加一个按钮，当点击按钮时，弹出邮件编辑视图。
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    [button setTitle:@"Write a mail" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor purpleColor]];
    [button addTarget:self action:@selector(sendMail) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

#pragma mark - 添加一个方法，用来实现发送塑件功能。
- (void)sendMail
{
    // NSClassFromString这个方法判断类是否存在，如果存在就动态的加载，不存在就返回一个空对象。
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    
    if (mailClass == nil) {
        // canSendMail方法检查用户是否设置了邮件账户。
        if ([mailClass canSendMail]) {
            // 如果设置了邮件账户，显示邮件视图控制器。
            [self displayMailBox];
        }
        else
        {
            // 否则调用设备浏览器，跳转到邮件服务器。
            [self showMailBoxOnDevice];
        }
    }
    else
    {
        [self showMailBoxOnDevice];
    }
}

#pragma mark - 添加一个方法，用来打开邮件视图控制器。
- (void)disPlayMailBox
{
    // 初始化邮件视图控制器。
    MFMailComposeViewController *mailBox = [[MFMailComposeViewController alloc] init];
    
    // 设置收件人邮箱。
    NSArray *recipient = [NSArray arrayWithObjects:@"jiaxianhua@gmail.com"];
    [mailBox setToRecipients:recipient];

    // 设置邮件标题。
    [mailBox setSubject:@"Help!"];
    
    // 设置邮件内容。
    NSString *messageBody = @"He, Jiaxh, Can you please do me a faveor?";
    [mailBox setMessageBody:messageBody isHTML:YES];
    
    // 设置一张图片为邮件附件。
    UIImage *attachedPic = [UIImage imageNamed:@"pic.png"];
    NSData *data = UIImagePNGRepresentation(attachedPic);
    [mailBox addAttachmentData:data mimeType:@"" fileName:@"pic.png"];
    
     // 设置邮件发送监听代理。
    mailBox.mailComposeDelegate = self;
    // 显示邮件编辑视图。
    [self presentModalViewController:mailBox animated:YES];
}

#pragma mark - 调用设备浏览器，跳转到邮件服务器。
- (void)showMailBoxOnDevice
{
    // 设置收件人邮箱。
    NSString *recipient = @"mailto:jiaxianhua@gmail.com&subject=Help!";
    // 设置邮件内容。
    NSString *messageBody = @"Hi, Jiaxh, Can you please do me a favor?";
    
    NSString *mail = [NSString stringWithFormat:@"%@%@", recipient, messageBody];
    mail = [mail stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    // 获取UIApplication单例对象，然后调用openURL方法。打开一个邮件服务器网址。
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mail]];
}

#pragma mark - 添加代理方法，处理邮件发送事件。
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    NSString *message;
    
    // 遍历邮件发送状态。
    switch (result)
    {
            // 处理用户取消邮件发送时的情况。
        case MFMailComposeResultCancelled:
            message = @"Mail cancled.";
            break;
            // 处理用户保存邮件草稿时的情况。
        case MFMailComposeResultSaved:
            message = @"Mail Saved!";
            break;
            // 处理邮件发送成功时的情况。
        case MFMailComposeResultSent:
            message = @"Mail sent.";
            break;
            // 处理邮件发送失败时的情况。
        case MFMailComposeResultFailed:
            message = @"Mail failed.";
            
        default:
            break;
    }
    
    NSLog(@"---------- %@", message);
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"------------ finish ---------");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
