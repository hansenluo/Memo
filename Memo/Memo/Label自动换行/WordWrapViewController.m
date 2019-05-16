//
//  WordWrapViewController.m
//  Memo
//
//  Created by 罗世权 on 2018/12/10.
//  Copyright © 2018年 hansen. All rights reserved.
//

#import "WordWrapViewController.h"

@interface WordWrapViewController ()

@property (nonatomic, strong) UILabel *examintroLabel;

@end

@implementation WordWrapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.examintroLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, 250, 50)];
    self.examintroLabel.text = @"excel文字自动换行, 一般情况下,在Excel某列的单元格中,列宽都不大,只要是输入了比较多的文字,那么,这些文字尽管能显示出来,但是却超出了当前单元格的宽度。";
    self.examintroLabel.font = [UIFont systemFontOfSize:14.0f];
    self.examintroLabel.lineBreakMode =  NSLineBreakByWordWrapping;
    self.examintroLabel.numberOfLines = 0;
    
    CGRect txtFrame = self.examintroLabel.frame;
    self.examintroLabel.frame = CGRectMake(10, 160, txtFrame.size.width = [self.examintroLabel.text boundingRectWithSize:CGSizeMake(txtFrame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.examintroLabel.font,NSFontAttributeName, nil] context:nil].size.width, txtFrame.size.height =[self.examintroLabel.text boundingRectWithSize:CGSizeMake(txtFrame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.examintroLabel.font,NSFontAttributeName, nil] context:nil].size.height);
    self.examintroLabel.frame = CGRectMake(10, 160, txtFrame.size.width, txtFrame.size.height);
    
    NSLog(@"宽 = %f,高 = %f",self.examintroLabel.frame.size.width,self.examintroLabel.frame.size.height);
    
    [self.view addSubview:self.examintroLabel];
}


@end
