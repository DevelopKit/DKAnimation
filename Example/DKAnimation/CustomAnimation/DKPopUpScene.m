//
//  DKPopUpScene.m
//  DKAnimation
//
//  Created by NaCai on 16/8/26.
//  Copyright © 2016年 qiang zhai. All rights reserved.
//

#import "DKPopUpScene.h"
#import <pop/POP.h>
@interface DKPopUpScene ()
@property (weak, nonatomic) IBOutlet UIView *popUpView;

@end

@implementation DKPopUpScene

- (void)viewDidLoad {
    [super viewDidLoad];
    self.popUpView.layer.cornerRadius = 50.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)startAnimate {
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    animation.springBounciness = 10;
    animation.springSpeed = 20;

    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0,0)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(1.5,1.5)];

    [self.popUpView.layer pop_addAnimation:animation forKey:@"scale"];

    POPBasicAnimation *opacity = [POPBasicAnimation easeInEaseOutAnimation];
    opacity.property = [POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
    opacity.toValue = @1.0f;
    opacity.duration = .25;
    [self.popUpView.layer pop_addAnimation:opacity forKey:@"opacity"];
}
@end
