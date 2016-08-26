//
//  DKFlyInScene.m
//  DKAnimation
//
//  Created by NaCai on 16/8/26.
//  Copyright © 2016年 qiang zhai. All rights reserved.
//

#import "DKFlyInScene.h"
#import <pop/POP.h>
@interface DKFlyInScene ()
@property (weak, nonatomic) IBOutlet UIView *flyInView;

@end

@implementation DKFlyInScene

- (void)viewDidLoad {
    [super viewDidLoad];
    self.flyInView.layer.cornerRadius = 8;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)startAnimate {
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    animation.springBounciness = 6;
    animation.springSpeed = 10;

    animation.toValue = @(self.view.center.y);
    [self.flyInView.layer pop_addAnimation:animation forKey:@"MoveCenter"];

    POPBasicAnimation *opacity = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacity.fromValue = @0.0f;
    opacity.toValue = @1.0f;
    opacity.duration = .25f;
    [self.flyInView.layer pop_addAnimation:opacity forKey:@"opacity"];

    POPBasicAnimation *rotation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
//    rotation.beginTime = CACurrentMediaTime() + 0.1;
    rotation.fromValue = @(-M_PI_4);
    rotation.toValue = @0;
    rotation.duration = .4;
    [self.flyInView.layer pop_addAnimation:rotation forKey:@"rotation"];
}
@end
