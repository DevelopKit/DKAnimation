//
//  DKBasicStudyScene.m
//  DKAnimation
//
//  Created by NaCai on 16/8/26.
//  Copyright © 2016年 qiang zhai. All rights reserved.
//

#import "DKBasicStudyScene.h"
#import <pop/POP.h>

@interface DKBasicStudyScene ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *lbl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;
@property (weak, nonatomic) IBOutlet UIView *topView;

@end

@implementation DKBasicStudyScene

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.slider addTarget:self action:@selector(sliderTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.slider addTarget:self action:@selector(sliderTouchDownAction:) forControlEvents:UIControlEventTouchDown];
}


#pragma mark - UIAction

- (void)sliderAction:(UISlider *)sender {
    self.lbl.text = [NSString stringWithFormat:@"Duration: %.2f",sender.value];
}
- (void)sliderTouchUpInsideAction:(UISlider *)sender {
    [self startAnimate];
}
- (void)sliderTouchDownAction:(UISlider *)sender {
    [self.topView.layer pop_removeAllAnimations];
    [self.view layoutIfNeeded];
}

- (IBAction)segAction:(id)sender {
    [self.topView.layer pop_removeAllAnimations];
    [self startAnimate];
}

#pragma mark - Override super methods
- (void)startAnimate {
    POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerTranslationX];
    animation.duration = self.slider.value;

    NSString *timingFunction = kCAMediaTimingFunctionLinear;
    if (self.segControl.selectedSegmentIndex == 1) {
        timingFunction = kCAMediaTimingFunctionEaseIn;
    } else if (self.segControl.selectedSegmentIndex == 2) {
        timingFunction = kCAMediaTimingFunctionEaseOut;
    } else {
        timingFunction = kCAMediaTimingFunctionEaseInEaseOut;
    }
    animation.timingFunction = [CAMediaTimingFunction functionWithName:timingFunction];

    animation.fromValue = @(0);
    animation.toValue = @(self.view.center.x);
    animation.completionBlock = ^(POPAnimation *animation1, BOOL finished){
        if (finished) {
            [self startAnimate];
        }
    };
    [self.topView.layer pop_addAnimation:animation forKey:@"moveX"];
}
@end
