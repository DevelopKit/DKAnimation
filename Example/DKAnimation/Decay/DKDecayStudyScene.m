//
//  DKDecayStudyScene.m
//  DKAnimation
//
//  Created by NaCai on 16/8/26.
//  Copyright © 2016年 qiang zhai. All rights reserved.
//

#import "DKDecayStudyScene.h"
#import <pop/POP.h>

static NSString *names[] = {
        @"Velocity",
        @"Deceleration",
};

@interface DKDecayStudyScene ()
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (strong, nonatomic) IBOutletCollection(UISlider) NSArray *sliders;
@property (weak, nonatomic) IBOutlet UIView *topView;

@end

@implementation DKDecayStudyScene

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.sliders enumerateObjectsUsingBlock:^(UISlider *slider, NSUInteger idx, BOOL *stop) {
        [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
        [slider addTarget:self action:@selector(sliderTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
        [slider addTarget:self action:@selector(sliderTouchDownAction:) forControlEvents:UIControlEventTouchDown];
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

#pragma mark - Override super methods
- (void)startAnimate {
    POPDecayAnimation *animation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerTranslationX];
    animation.velocity = @([(UISlider *)self.sliders[0] value]);
    animation.deceleration = [(UISlider *)self.sliders[1] value];

    animation.fromValue = @(0);
    animation.completionBlock = ^(POPAnimation *animation1,BOOL finished){
        if (finished) {
            [self startAnimate];
        }
    };
    [self.topView.layer pop_addAnimation:animation forKey:@"moveX"];
}
@end
