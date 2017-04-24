//
//  ViewController.m
//  CABasicAnimation
//
//  Created by 王伟 on 2017/4/24.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "ViewController.h"

#define angle2Rad(angle) ((angle) / 180.0 * M_PI)
#define angle 8

@interface ViewController () <CAAnimationDelegate>
@property (strong, nonatomic) IBOutlet UIView *redView;
@property (strong, nonatomic) IBOutlet UIImageView *xinView;
@property (strong, nonatomic) IBOutlet UIImageView *myView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
}

static int _i = 1;

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    _i++;
    
    if (_i>3) _i=1;
    
    // 核心动画都是基于layer
    
    // CABasicAnimation1
    // [self CABasicAnimation1];
    // CABasicAnimation2
    // [self CABasicAnimation2];
    

    // 添加多个value值
    //[self CAKeyframeAnimation1];
    // View的layer跟随者path路径进行动画
    //[self CAKeyframeAnimation2];
    
    // 转场动画
    // [self CATransition];
    
    // 动画组（让许多动画一起执行）
    CABasicAnimation *a = [CABasicAnimation animation];
    a.keyPath = @"transform.";
    
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CAAnimation *animation1 = [self CABasicAnimation1];
    CAAnimation *animation2 =  [self CAKeyframeAnimation2];
    
    group.animations = @[animation1, animation2];
    
    
    [self.redView.layer addAnimation:group forKey:nil];
    
}

- (CAAnimation *)CATransition {
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    
    
    /*
     1.#define定义的常量
     kCATransitionFade   交叉淡化过渡
     kCATransitionMoveIn 新视图移到旧视图上面
     kCATransitionPush   新视图把旧视图推出去
     kCATransitionReveal 将旧视图移开,显示下面的新视图
     
     2.用字符串表示
     pageCurl            向上翻一页
     pageUnCurl          向下翻一页
     rippleEffect        滴水效果
     suckEffect          收缩效果，如一块布被抽走
     cube                立方体效果
     oglFlip             上下翻转效果
     */
    animation.type = @"rippleEffect";
    animation.delegate = self;
    
    [self.imageView.layer addAnimation:animation forKey:nil];
    //self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",_i]];
    
    return animation;

}

- (CAAnimation *)CAKeyframeAnimation2 {

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    // 设置参数
    // UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 200, 200)];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    animation.path = path.CGPath;
    animation.keyPath = @"position";
    
    // 设置重复次数
    animation.repeatCount = MAXFLOAT;
    animation.duration = 0.8;
    
    // 动画完成时是否移除动画
    animation.removedOnCompletion = NO;
    animation.fillMode = @"forwards";
    
    [self.redView.layer addAnimation:animation forKey:nil];
    return animation;

}

- (CAAnimation *)CAKeyframeAnimation1 {
    // 图片气泡抖动
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    // 设置重复次数
    animation.repeatCount = MAXFLOAT;
    animation.duration = 0.5;
    
    // 动画完成时是否移除动画
    animation.removedOnCompletion = NO;
    animation.fillMode = @"forwards";
    
    // 设置参数
    animation.keyPath = @"transform.rotation";
    animation.values = @[@(angle2Rad(-angle)), @(angle2Rad(angle)),@(angle2Rad(-angle))];
    
    [self.myView.layer addAnimation:animation forKey:nil];
    return animation;
}

- (CAAnimation *)CABasicAnimation1 {
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    // 设置动画时间
    animation.duration = 1;
    
    // 设置动画完成时是否移除动画
    animation.removedOnCompletion = NO;
    animation.fillMode = @"forwards";
    
    // 设置动画的参数
    animation.keyPath = @"position.x";
    animation.toValue = @100;
    
    // key:给这个动画起个名字
    [self.redView.layer addAnimation:animation forKey:nil];
    return animation;
}


- (CAAnimation *)CABasicAnimation2 {
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    // 设置动画时间
    animation.duration = 1;
    
    // 自动反转，动画怎么形成，就原路还原
    animation.autoreverses = YES;
    
    // 设置重复次数
    animation.repeatCount = MAXFLOAT;
    
    // 动画完成时是否移除动画
    animation.removedOnCompletion = NO;
    animation.fillMode = @"forwards";
    
    // 缩放尺寸
    animation.keyPath = @"transform.scale";
    animation.toValue = @0;
    
    // 添加动画
    [self.xinView.layer addAnimation:animation forKey:nil];
    return animation;

}


- (void)animationDidStart:(CAAnimation *)anim {

    
    NSLog(@"%s",__func__);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"%s",__func__);
    
    [UIView animateWithDuration:0.3 animations:^{
        //self.imageView.transform = CGAffineTransformMakeScale(2.0, 2.0);
        self.imageView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.imageView removeFromSuperview];
    }];
    
    
}

@end

