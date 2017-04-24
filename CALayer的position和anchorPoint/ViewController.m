//
//  ViewController.m
//  CALayer的position和anchorPoint
//
//  Created by 王伟 on 2017/4/24.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) CALayer *layer;
@property (strong, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /*
     0. position是相对父控件的，anchorPoint是相对layer本身（默认值是0.5，0.5），
     1. center和position是一样的值，都是同时变化的
     2. position和anchorPoint是重合的，同一个点
     */
    
    // 添加一个layer
    CALayer *layer = [CALayer layer];
    // layer的颜色
    layer.backgroundColor = [UIColor redColor].CGColor;
    // layer的frame值
    // layer.frame = CGRectMake(0, 0, 100, 100);
    layer.bounds = CGRectMake(0, 0, 100, 100);
    // 添加layer
    [self.view.layer addSublayer:layer];
    self.layer = layer;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // layer的position
    // self.layer.position = CGPointMake(50, 50);
    
    // layer的anchorPoint
    self.layer.anchorPoint = CGPointMake(0, -1);
    
    
    // center和position是一样的值，都是同时变化的
    // self.redView.center = self.view.center;
    self.redView.layer.position = self.view.center;
    self.redView.layer.anchorPoint = CGPointMake(1, 0);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
