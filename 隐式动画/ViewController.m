//
//  ViewController.m
//  隐式动画
//
//  Created by 王伟 on 2017/4/24.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *redView;

/** <#name#> */
@property (nonatomic, weak) CALayer *layer;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 自定义layer
    /*
     self.layer.position = self.view.center;
     self.layer.anchorPoint = CGPointMake(0, 1);
     self.layer.backgroundColor = [UIColor yellowColor].CGColor;
     */
    
    // 设置非主layer的隐式动画的 动画参数
    /*
     // 1.设置动画是否可用
     [CATransaction setDisableActions:YES];
     
     // 2.设置动画时长
     [CATransaction setAnimationDuration:5];
     
     // 3.设置动画区域
     [CATransaction begin];
     [CATransaction setDisableActions:YES];
     [CATransaction setAnimationDuration:5];
     ...
     [CATransaction commit];
     
     */
    [CATransaction begin];
    [CATransaction setDisableActions:NO];
    [CATransaction setAnimationDuration:5];
    
    self.layer.backgroundColor = [UIColor yellowColor].CGColor;
    self.layer.position = self.view.center;
    
    [CATransaction commit];
    self.layer.anchorPoint = CGPointMake(0, 1);
    
    
    // 系统layer
    self.redView.layer.backgroundColor = [UIColor yellowColor].CGColor;
    self.redView.layer.position = CGPointMake(0, 400);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     1. 跟层layer（view.layer）是没有隐式动画的
     2. 自定义layer是系统自带动画属性的
     */
    
    // 自定义layer
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    [self.view.layer addSublayer:layer];
    self.layer = layer;
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
