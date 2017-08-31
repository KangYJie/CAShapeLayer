//
//  KYJOne.m
//  CAShapeLayer
//
//  Created by djzx on 2017/3/21.
//  Copyright © 2017年 kangyuejie. All rights reserved.
//

#import "KYJOne.h"

@interface KYJOne ()<CAAnimationDelegate>
{
    CAShapeLayer *layer;
    CAShapeLayer* lineLayer;
    int len;
}
@end

@implementation KYJOne


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;

    self.navigationItem.title = self.Navtitle;
    self.view.backgroundColor = [UIColor colorWithRed:0.09 green:0.57 blue:0.73 alpha:1.00];
        //CAShapeLayer和UIBezierPath画图
    
        layer = [CAShapeLayer layer];
        layer.fillColor = [UIColor clearColor].CGColor;
        layer.lineWidth =  20.0f;
        layer.lineCap = kCALineCapRound;
        layer.lineJoin = kCALineJoinRound;
        layer.strokeColor = [UIColor redColor].CGColor;
        [self.view.layer addSublayer:layer];
    
        // 创建贝塞尔路径
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:80 startAngle:0 endAngle:M_PI*2 clockwise:NO];
    
    
        // 关联layer和贝塞尔路径
        layer.path = path.CGPath;
    
        // 创建Animation
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.fromValue = @(0.0);
        animation.toValue = @(1.0);
        layer.autoreverses = NO;
        animation.duration = 3.0;
    //利用kvo给animation添加键值对
    [animation setValue:@"strokeEnd" forKey:@"strokeEnd"];
        // 设置layer的animation
        [layer addAnimation:animation forKey:nil];
        animation.delegate = self;
    
    //strokeColor
    CABasicAnimation *strokeAnim = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
    strokeAnim.fromValue         = (id) [UIColor redColor].CGColor;
    strokeAnim.toValue           = (id) [UIColor yellowColor].CGColor;
    strokeAnim.duration          = 3.0;
    strokeAnim.repeatCount       = 10000;
    strokeAnim.autoreverses      = YES;

    [layer addAnimation:strokeAnim forKey:nil];
    strokeAnim.delegate = self;
    

    
    
        int count = 16;
        for (int i = 0; i<count; i++) {
             lineLayer = [CAShapeLayer layer];
            lineLayer.fillColor = [UIColor blueColor].CGColor;
            lineLayer.strokeColor = [UIColor yellowColor].CGColor;
            lineLayer.lineWidth = 15.0f;
            lineLayer.lineCap = kCALineCapRound;
            lineLayer.lineJoin = kCALineCapRound;
            [self.view.layer addSublayer:lineLayer];
    
            UIBezierPath* path2 = [UIBezierPath bezierPath];
            int x = 200+100*cos(2*M_PI/count*i);
            int y = 200-100*sin(2*M_PI/count*i);
            if (i%2 ==0) {
                
                 len = 50;
            }else{
                 len  =20;
            }
            
            [path2 moveToPoint:CGPointMake(x, y)];
            [path2 addLineToPoint:CGPointMake(x+len*cos(2*M_PI/count*i), y-len*sin(2*M_PI/count*i))];
            lineLayer.path = path2.CGPath;
            [lineLayer addAnimation:animation forKey:@"strokeEndline"];
            [lineLayer addAnimation:strokeAnim forKey:@"animateStrokeColor"];
        }
        
    
    

}
//animation结束回调
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//    NSLog(@"yes");
    NSLog(@"%@",layer.animationKeys);
  
    if ([[anim valueForKey:@"strokeEnd"]isEqualToString:@"strokeEnd"]) {
                layer.fillColor = [UIColor redColor].CGColor;
        [self changeviewcolor];

    }
    
    
    
}


//fillColor填充色动画
-(void)changeviewcolor{
    
    //strokeColor
    CABasicAnimation *strokeAnim2 = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
    strokeAnim2.fromValue         = (id) [UIColor redColor].CGColor;
    strokeAnim2.toValue           = (id) [UIColor yellowColor].CGColor;
    strokeAnim2.duration          = 3.0;
    strokeAnim2.repeatCount       = 10000;
    strokeAnim2.autoreverses      = YES;
    
    [layer addAnimation:strokeAnim2 forKey:nil];
    strokeAnim2.delegate = self;


    //fillColor填充色动画
    
    CABasicAnimation *fillColorAnim = [CABasicAnimation animationWithKeyPath:@"fillColor"];
    fillColorAnim.fromValue         = (id) [UIColor orangeColor].CGColor;
    fillColorAnim.toValue           = (id) [UIColor redColor].CGColor;
    fillColorAnim.duration          = 3.0;
    fillColorAnim.repeatCount       = 10000;
    fillColorAnim.autoreverses      = YES;
    [layer addAnimation:strokeAnim2 forKey:@"animateStrokeColor"];
    fillColorAnim.delegate = self;
    [layer addAnimation:fillColorAnim forKey:nil];

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
