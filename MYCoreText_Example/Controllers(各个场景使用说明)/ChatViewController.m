//
//  ChatViewController.m
//  MYCoreText_Example
//
//  Created by 流年划过颜夕 on 2017/6/20.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import "ChatViewController.h"
#import "MYCoreTextLabel.h"

@interface ChatViewController ()<MYCoreTextLabelDelegate>

@property (nonatomic, strong) MYCoreTextLabel *coretextLabel;
@property (nonatomic, strong) MYCoreTextLabel *coretextOtherLabel;
@end

@implementation ChatViewController

- (MYCoreTextLabel *)coretextLabel
{
    if (!_coretextLabel) {
        _coretextLabel = [[MYCoreTextLabel alloc]init];
        _coretextLabel.delegate = self;
        _coretextLabel.norLinkBackColor = [UIColor redColor];  //设置常规链接点击背景色   @ #话题#  www.baidu.com
        _coretextLabel.norLinkFont = [UIFont systemFontOfSize:20]; //设置常规链接的字体大小
        _coretextLabel.norLinkColor = [UIColor greenColor]; //设置常规链接的颜色
        _coretextLabel.hiddenNormalLink = NO;  // 是否显示常规链接特性  ,默认为NO,默认显示常规链接. 如果为YES , 上述的赋值没有任何意义 , 默认为NO
        [_coretextLabel setText:@"看到他满脸的胡渣以及母亲双鬓若隐若现的白发。每次吃栗子我都会想起父亲，我是测试数据[擦汗]我是测试数据[没有对应表情情况]我是测试数据我是测试数ww.我不是网址.com据我是测www.abc.com试数据我是测试数[我不存在]据我是测试更是心痛不已。www.123.com" customLinks:@[@"哥哥"] keywords:nil];
    }
    [_coretextLabel  addChatbubbleFromMe:1];
    return _coretextLabel;
}
- (MYCoreTextLabel *)coretextOtherLabel
{
    if (!_coretextOtherLabel) {
        _coretextOtherLabel = [[MYCoreTextLabel alloc]init];
        _coretextOtherLabel.delegate = self;
        _coretextOtherLabel.norLinkBackColor = [UIColor redColor];  //设置常规链接点击背景色   @ #话题#  www.baidu.com
        _coretextOtherLabel.norLinkFont = [UIFont systemFontOfSize:20]; //设置常规链接的字体大小
        _coretextOtherLabel.norLinkColor = [UIColor greenColor]; //设置常规链接的颜色
        _coretextOtherLabel.hiddenNormalLink = NO;  // 是否显示常规链接特性  ,默认为NO,默认显示常规链接. 如果为YES , 上述的赋值没有任何意义 , 默认为NO
        [_coretextOtherLabel setText:@"阿南。#测试#现在每次吃栗子我都会想起父亲，我是测试数据[擦汗]我是测试数据[没有对应表情情况]我是测试数据我是测试数ww.我不是网址.com据我是测www.abc.com试数据我是测试数[我不存在]据我是测试数据我是[测试表情]测试数据我是测" customLinks:@[@"哥哥"] keywords:nil];
    }
    [_coretextOtherLabel  addChatbubbleFromMe:0];
    return _coretextOtherLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"只展示链接,其他不展示";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.coretextLabel];
    [self.view addSubview:self.coretextOtherLabel];
    
    CGSize size = [self.coretextLabel sizeThatFits:CGSizeMake(300, MAXFLOAT)];
    self.coretextLabel.frame = CGRectMake(30, 100, size.width, size.height);
    
    CGSize otherSize = [self.coretextOtherLabel sizeThatFits:CGSizeMake(300, MAXFLOAT)];
    self.coretextOtherLabel.frame = CGRectMake(self.view.frame.size.width-otherSize.width-30,100+size.height+100 , otherSize.width, otherSize.height);
}


- (void)linkText:(NSString *)clickString type:(MYLinkType)linkType
{
    NSLog(@"----------%@--------%li",clickString,linkType);
}

@end
