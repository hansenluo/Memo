//
//  KVOViewController.m
//  Memo
//
//  Created by 罗世权 on 2018/11/29.
//  Copyright © 2018年 hansen. All rights reserved.
//

#import "KVOViewController.h"
#import "Person.h"

@interface KVOViewController () {
    Person *aperson;
}

@end

@implementation KVOViewController

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    [aperson removeObserver:self forKeyPath:@"age"];
   // [aperson removeObserver:self forKeyPath:@"name"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    aperson = [[Person alloc] init];
    aperson.age = 10;
    aperson.name = @"tom";
    [aperson addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"click" forState:UIControlStateNormal];
    [button setTintColor:[UIColor redColor]];
    [button setFrame:CGRectMake(100, 100, 100, 50)];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick:(UIButton *)sender
{
    aperson.age = 20;
    [aperson setValue:@"sam" forKey:@"name"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (([keyPath isEqualToString:@"age"])) {
        NSLog(@"oldage = %@,newage = %@",change[NSKeyValueChangeOldKey],change[NSKeyValueChangeNewKey]);
    }else if ([keyPath isEqualToString:@"name"]){
        NSLog(@"oldname = %@,newname = %@",change[NSKeyValueChangeOldKey],change[NSKeyValueChangeNewKey]);
    }
}

@end
