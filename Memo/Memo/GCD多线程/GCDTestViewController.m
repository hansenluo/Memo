//
//  GCDTestViewController.m
//  Memo
//
//  Created by 罗世权 on 2018/12/17.
//  Copyright © 2018年 hansen. All rights reserved.
//

#import "GCDTestViewController.h"

@interface GCDTestViewController ()

@end

@implementation GCDTestViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    NSLog(@"3");
}

- (void)loadView{
    [super loadView];
    NSLog(@"1");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"2");
    // Do any additional setup after loading the view.
    
}

- (void)gcddome1{
    dispatch_block_t block = ^{
        NSLog(@"任务一");
    };
    
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, block);
}

@end
