//
//  NSString+Category.h
//  Memo
//
//  Created by 罗世权 on 2018/11/27.
//  Copyright © 2018年 hansen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Category){
    /* 不可添加实例变量 */
}

/*可以添加属性变量，不过勉强添加不会生成setter和getter方法 */
//@property (nonatomic, copy) NSString *newString;

/* 以下两个类别的方法可以在.m文件中不实现，但是不实现不可调用，否则会奔溃 */
/* 如果category中的方法和类中原有方法同名，运行时会优先调用category中的方法。也就是category中的方法会覆盖掉类中原有的方法，所以不要重名。 */
/* 扩张一个类方法 */
+ (void)categoryClassMethodOfString;

/* 扩展一个实例方法 */
- (void)categoryInstanceMethodOfString;

@end

NS_ASSUME_NONNULL_END
