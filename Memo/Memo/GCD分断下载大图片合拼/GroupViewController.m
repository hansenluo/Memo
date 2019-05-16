//
//  GroupViewController.m
//  Memo
//
//  Created by 罗世权 on 2018/12/10.
//  Copyright © 2018年 hansen. All rights reserved.
//

#define global_queue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define main_queue dispatch_get_main_queue()

#import "GroupViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface GroupViewController ()

@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIImageView *bigImageView;

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.imageView1 sd_setImageWithURL:[NSURL URLWithString:@""]];
    
    self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 200, 150, 150)];
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(250, 200, 150, 150)];
    self.bigImageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 500, 150, 150)];
    [self.view addSubview:self.imageView1];
    [self.view addSubview:self.imageView2];
    [self.view addSubview:self.bigImageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"点击下载图片" forState:UIControlStateNormal];
    [button setTintColor:[UIColor redColor]];
    [button setFrame:CGRectMake(100, 100, 100, 50)];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)buttonClick:(UIButton *)sender
{
    // 创建一个组
    dispatch_group_t group = dispatch_group_create();
    
    // 开启一个任务下载图片1
    __block UIImage *image1 = nil;
    dispatch_group_async(group, global_queue, ^{
        image1 = [self imageWithURL:@"http://pic.4j4j.cn/upload/pic/20130621/0ad335853a.jpg"];
    });
    
    // 开启一个任务下载图片2
    __block UIImage *image2 = nil;
    dispatch_group_async(group, global_queue, ^{
        image2 = [self imageWithURL:@"http://img.redocn.com/200906/2/321782_124390997641aY.jpg"];
    });
    
    // 同时执行下载图片1和下载图片2操作
    // 等group中的所有任务都执行完毕, 再回到主线程执行其他操作
    dispatch_group_notify(group, main_queue, ^{
        self.imageView1.image = image1;
        self.imageView2.image = image2;
        
        // 合并
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 100), NO, 0.0);
        [image1 drawInRect:CGRectMake(0, 0, 100, 100)];
        [image2 drawInRect:CGRectMake(100, 0, 100, 100)];
        self.bigImageView.image = UIGraphicsGetImageFromCurrentImageContext();
        // 关闭上下文
        UIGraphicsEndImageContext();
        
    });
}

- (UIImage *)imageWithURL:(NSString *)urlStr
{
    NSURL *url = [NSURL URLWithString:urlStr];
    NSLog(@"-------下载开始");
    NSData *data = [NSData dataWithContentsOfURL:url]; // 这行会比较耗时
    NSLog(@"-------下载完成");
    return [UIImage imageWithData:data];
}

@end
