//
//  DKTransformScene.m
//  DKAnimation
//
//  Created by NaCai on 16/8/26.
//  Copyright © 2016年 qiang zhai. All rights reserved.
//

#import "DKTransformScene.h"
#import <pop/POP.h>
@interface DKTransformScene ()
@property (weak, nonatomic) IBOutlet UIView *mainView;

@end

@implementation DKTransformScene

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)startAnimate {
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    animation.springBounciness = 6;
    animation.springSpeed = 12;

    animation.toValue = [NSValue valueWithCGSize:CGSizeMake(300,50)];

    animation.completionBlock = ^(POPAnimation *animation1, BOOL finished){
        if (finished) {
            CGFloat lineWidth = 50-8*2;
            CAShapeLayer *shapeLayer = [CAShapeLayer new];
            shapeLayer.lineWidth = lineWidth;
            shapeLayer.lineCap = kCALineCapRound;
            shapeLayer.lineJoin  = kCALineJoinBevel;
            shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
            shapeLayer.strokeEnd = 0.0f;

            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(lineWidth,50/2)];
            [path addLineToPoint:CGPointMake(300-lineWidth*2,50/2)];
            shapeLayer.path = path.CGPath;

            [self.mainView.layer addSublayer:shapeLayer];

            POPBasicAnimation *animation2 = [POPBasicAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
            animation2.toValue = @1.0f;
            animation2.duration = 4;
            animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            animation2.completionBlock = ^(POPAnimation *animation3,BOOL finished){
                [shapeLayer removeFromSuperlayer];
                POPSpringAnimation *animation4 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
                animation4.springBounciness = 6;
                animation4.springSpeed = 12;
                animation4.toValue = [NSValue valueWithCGSize:CGSizeMake(100,100)];
                [self.mainView.layer pop_addAnimation:animation4 forKey:@"sizeNew"];
            };
            [shapeLayer pop_addAnimation:animation2 forKey:@"strokeEnd"];
        }
    };
    [self.mainView.layer pop_addAnimation:animation forKey:@"size"];


}
@end
