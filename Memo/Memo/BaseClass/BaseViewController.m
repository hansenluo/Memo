//
//  BaseViewController.m
//  Memo
//
//  Created by 罗世权 on 2018/11/28.
//  Copyright © 2018年 hansen. All rights reserved.
//

#import "BaseViewController.h"
#import "KVOViewController.h"
#import "GroupViewController.h"
#import "WordWrapViewController.h"
#import "GCDTestViewController.h"
#import "MasonryViewController.h"
#import "STableViewController.h"
#import "MTableViewController.h"

@interface BaseViewController () <UITableViewDelegate,UITableViewDataSource> {
    NSArray *baseArray;
}

@property (nonatomic, strong) UITableView *baseTableView;

@end

@implementation BaseViewController

//static Singleton * _instance = nil;
//+(instancetype) sharedInstance{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _instance= [[self alloc] init];
//    });
//    return _instance;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    baseArray = [[NSArray alloc] initWithObjects:@"类别和类扩展",@"KVO",@"GCD分段下载图片",@"Label自动换行",@"'GCD多线程",@"Masonry",@"tableView单选",@"tableView多选", nil];
    
    _baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    _baseTableView.dataSource = self;
    _baseTableView.delegate = self;
    _baseTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_baseTableView];
    
    
   // [self performSelector:@selector(log)];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self performSelector:@selector(log) withObject:self afterDelay:1.0];
//        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
//        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
//        [runLoop run];
    });
}

- (void)log{
    NSLog(@"test");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [baseArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell_id = @"cell_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[baseArray objectAtIndex:indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1) {
        KVOViewController *kvoViewController = [[KVOViewController alloc] init];
        kvoViewController.view.backgroundColor = [UIColor whiteColor];   //消除push的残影
        [self.navigationController pushViewController:kvoViewController animated:YES];
        kvoViewController = nil;
    }else if (indexPath.row == 2) {
        GroupViewController *groupViewController = [[GroupViewController alloc] init];
        groupViewController.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:groupViewController animated:YES];
        groupViewController = nil;
    }else if (indexPath.row == 3) {
        WordWrapViewController *wordWrapViewController = [[WordWrapViewController alloc] init];
        wordWrapViewController.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:wordWrapViewController animated:YES];
        wordWrapViewController = nil;
    }else if (indexPath.row == 4) {
        GCDTestViewController *testViewController = [[GCDTestViewController alloc] init];
        testViewController.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:testViewController animated:YES];
        testViewController = nil;
    }else if (indexPath.row == 5) {
        MasonryViewController *masonryViewController = [[MasonryViewController alloc] init];
        masonryViewController.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:masonryViewController animated:YES];
        masonryViewController = nil;
    }else if (indexPath.row == 6) {
        STableViewController *testViewController = [[STableViewController alloc] init];
        testViewController.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:testViewController animated:YES];
        testViewController = nil;
    }else if (indexPath.row == 7) {
        MTableViewController *testViewController = [[MTableViewController alloc] init];
        testViewController.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:testViewController animated:YES];
        testViewController = nil;
    }
}

@end

