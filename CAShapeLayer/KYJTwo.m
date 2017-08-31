//
//  KYJTwo.m
//  CAShapeLayer
//
//  Created by djzx on 2017/3/21.
//  Copyright © 2017年 kangyuejie. All rights reserved.
//

#import "KYJTwo.h"

@interface KYJTwo ()<CAAnimationDelegate>
{
    CAShapeLayer *circleLayer;
    
    UIView * viewanimation ;
}
@end

@implementation KYJTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationItem.title = self.Navtitle;
    self.view.backgroundColor = [UIColor colorWithRed:0.09 green:0.57 blue:0.73 alpha:1.00];
    
    
    [self drawCircle];
    [self amplifierAnimation];

    // Do any additional setup after loading the view.
}
#pragma  mark ----画圆
- (CAShapeLayer *)drawCircle {
    circleLayer = [CAShapeLayer layer];
    // 指定frame，只是为了设置宽度和高度
    circleLayer.frame = CGRectMake(0, 0, 200, 200);
    // 设置居中显示
    circleLayer.position = self.view.center;
    // 设置填充颜色
    circleLayer.fillColor = [UIColor orangeColor].CGColor;
    // 设置线宽
    circleLayer.lineWidth = 2.0;
    // 设置线的颜色
    circleLayer.strokeColor = [UIColor redColor].CGColor;
    
    // 使用UIBezierPath创建路径
    CGRect frame = CGRectMake(0, 0, 200, 200);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:frame];
    
    // 设置CAShapeLayer与UIBezierPath关联
    circleLayer.path = circlePath.CGPath;
    
    // 将CAShaperLayer放到某个层上显示
    [self.view.layer addSublayer:circleLayer];
    
    return circleLayer;
}

#pragma  mark ----放大动画
-(void)amplifierAnimation{
    viewanimation = [[UIView alloc]initWithFrame:CGRectMake(150, 70, 100, 50)];
    viewanimation.backgroundColor = [UIColor blueColor];
    [self.view addSubview:viewanimation];
    
    CABasicAnimation * BigAbimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    BigAbimation.duration = 5;
//    BigAbimation.toValue = [NSValue valueWithCGRect:CGRectMake(200, 120, 200, 100)];
    BigAbimation.toValue = @2.0;
    
    
//    BigAbimation.fromValue = @.5;
    BigAbimation.removedOnCompletion = NO;
    BigAbimation.fillMode = kCAFillModeForwards;
    [viewanimation.layer addAnimation:BigAbimation forKey:nil];
    
    
    
    BigAbimation.delegate =self;
    [circleLayer addAnimation:BigAbimation forKey:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
