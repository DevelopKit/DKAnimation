//
//  DKSpringStudyScene.m
//  DKAnimation
//
//  Created by NaCai on 16/8/25.
//  Copyright © 2016年 qiang zhai. All rights reserved.
//

#import <pop/POP.h>
#import "DKSpringStudyScene.h"

static NSString *names[] = {
        @"springBounciness",
        @"springSpeed",
        @"dynamicsTension",
        @"dynamicsFriction",
        @"dynamicsMass"
};

@interface DKSpringStudyScene ()
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (strong, nonatomic) IBOutletCollection(UISlider) NSArray *sliders;
@property (strong, nonatomic) IBOutletCollection(UISwitch) NSArray *switchs;
@property (weak, nonatomic) IBOutlet UIView *topView;

@end

@implementation DKSpringStudyScene

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.sliders enumerateObjectsUsingBlock:^(UISlider *slider, NSUInteger idx, BOOL *stop) {
        [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
        [slider addTarget:self action:@selector(sliderTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
        [slider addTarget:self action:@selector(sliderTouchDownAction:) forControlEvents:UIControlEventTouchDown];
    }];
    [self.switchs enumerateObjectsUsingBlock:^(UISwitch * obj, NSUInteger idx, BOOL *stop) {
        [obj addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UIAction

- (void)sliderAction:(UISlider *)sender {
    NSUInteger idx = (NSUInteger)sender.tag - 100;
    UILabel *label = self.labels[idx];
    label.text = [NSString stringWithFormat:@"%@: %.2f",names[idx],sender.value];
}
- (void)sliderTouchUpInsideAction:(UISlider *)sender {
    [self startAnimate];
}
- (void)sliderTouchDownAction:(UISlider *)sender {
    [self.topView.layer pop_removeAllAnimations];
    [self.view layoutIfNeeded];
}

- (void)switchAction:(UISwitch *)sender {
    [self startAnimate];
}

#pragma mark - Animate methods
- (void)startAnimate{
    [self.topView.layer pop_removeAllAnimations];
    
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    animation.springBounciness = [(UISlider *)self.sliders[0] value];
    animation.springSpeed = [(UISlider *)self.sliders[1] value];
    if ([self.switchs[0] isOn]) {
        animation.dynamicsTension = [(UISlider *)self.sliders[2] value];
    }
    if ([self.switchs[1] isOn]) {
        animation.dynamicsFriction = [(UISlider *)self.sliders[3] value];
    }

    if ([self.switchs[2] isOn]) {
        animation.dynamicsMass = [(UISlider *)self.sliders[4] value];
    }

    animation.fromValue = @(55);
    animation.toValue = @(self.view.center.x);
    animation.completionBlock = ^(POPAnimation *animation1 , BOOL finished){
        if (finished) {
            [self startAnimate];
        }
    };
    [self.topView.layer pop_addAnimation:animation forKey:@"moveX"];
}


@end
