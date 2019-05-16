//
//  NSString+Category.m
//  Memo
//
//  Created by 罗世权 on 2018/11/27.
//  Copyright © 2018年 hansen. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

+ (void)categoryClassMethodOfString
{
    NSLog(@"类方法");
}

- (void)categoryInstanceMethodOfString
{
    NSLog(@"实例方法");
}

@end
