//
//  ViewController.m
//  CATransform3D
//
//  Created by 王伟 on 2017/4/21.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    [UIView animateWithDuration:0.5 animations:^{
        // self.iconView.layer.transform = CATransform3DMakeTranslation(0, 0, 100);
        // self.iconView.layer.transform = CATransform3DMakeScale(0.5, 0, 0);
        // self.iconView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
        
        NSValue *value = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 1, 0) ];
        
        //[self.iconView.layer setValue:value forKey:@"transform"];
        
        [self.iconView.layer setValue:@(11) forKeyPath:@"transform.rotation.x"];
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
