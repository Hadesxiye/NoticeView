//
//  ViewController.m
//  NoticeView
//
//  Created by 王浩祯 on 2019/1/17.
//  Copyright © 2019 Hades. All rights reserved.
//

#import "ViewController.h"
#import "HadesNoticeView/NoticeView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NoticeView* noticeView;
    NSTimer* timer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self uiAction];
}
//Example
-(void)noneMode{
    noticeView = [NoticeView noticeViewInitTo:self.view];
    noticeView.mode = noticeViewMode_NoneButton;
    noticeView.titleLab.text = @"无按钮模式";
    noticeView.titleLab.font = [UIFont boldSystemFontOfSize:20];
    noticeView.contextView_height = 50;
    noticeView.contextView.text = @"这是无按钮模式，设置 contextView_height 可以修改内容的高度";
    [noticeView show];
    timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(closeView) userInfo:nil repeats:NO];
}
-(void)oneMode{
    noticeView = [NoticeView noticeViewInitTo:self.view];
    noticeView.mode = noticeViewMode_OneButton;
    noticeView.titleLab.text = @"单个按钮模式";
    noticeView.titleLab.font = [UIFont boldSystemFontOfSize:20];
    noticeView.contextView_height = 60;
    noticeView.contextView.text = @"这是单个按钮模式，通过访问 button_one 属性可以修改按钮属性";
    [noticeView.button_one setTitle:@"关闭" forState:UIControlStateNormal];
    [noticeView.button_one addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    [noticeView show];
}
-(void)closeView{
    [noticeView hide];
    [timer invalidate];
}
-(void)twoMode{
    noticeView = [NoticeView noticeViewInitTo:self.view];
    noticeView.mode = noticeViewMode_TwoButton;
    noticeView.titleLab.text = @"双按钮模式";
    noticeView.titleLab.font = [UIFont boldSystemFontOfSize:20];
    noticeView.contextView_height = 80;
    noticeView.contextView.text = @"这是双按钮模式，通过访问 button_one  属性可以修改按钮属性";
    [noticeView.button_one setTitle:@"关闭" forState:UIControlStateNormal];
    [noticeView.button_one addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    [noticeView.button_two setTitle:@"按钮2" forState:UIControlStateNormal];
    [noticeView show];
}
-(void)uiAction{
    UIButton* btn1 = [UIButton new];
    btn1.frame = CGRectMake(50, self.view.bounds.size.height/4, self.view.bounds.size.width - 100, 50);
    btn1.layer.cornerRadius = 5;
    btn1.layer.masksToBounds = YES;
    btn1.backgroundColor = [UIColor blackColor];
    [btn1 setTitle:@"无按钮模式" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(noneMode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    UIButton* btn2 = [UIButton new];
    btn2.frame = CGRectMake(50, self.view.bounds.size.height/2, self.view.bounds.size.width - 100, 50);
    btn2.layer.cornerRadius = 5;
    btn2.layer.masksToBounds = YES;
    btn2.backgroundColor = [UIColor blackColor];
    [btn2 setTitle:@"单按钮模式" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(oneMode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    UIButton* btn3 = [UIButton new];
    btn3.frame = CGRectMake(50, self.view.bounds.size.height/4*3, self.view.bounds.size.width - 100, 50);
    btn3.layer.cornerRadius = 5;
    btn3.layer.masksToBounds = YES;
    btn3.backgroundColor = [UIColor blackColor];
    [btn3 setTitle:@"双按钮模式" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(twoMode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
}
@end
