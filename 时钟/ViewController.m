//
//  ViewController.m
//  时钟
//
//  Created by 王伟 on 2017/4/24.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "ViewController.h"
#import "NSCalendar+WWAdd.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 自定义layer
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 1, 100);
    layer.position =
    [self.view.layer addSublayer:layer];
    self.layer = layer;
    
    
}


// 获取年、月、日、时、分、秒


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
