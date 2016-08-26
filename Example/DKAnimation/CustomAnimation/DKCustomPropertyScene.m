//
//  DKCustomPropertyScene.m
//  DKAnimation
//
//  Created by NaCai on 16/8/26.
//  Copyright © 2016年 qiang zhai. All rights reserved.
//

#import "DKCustomPropertyScene.h"
#import <pop/POP.h>

@interface DKCustomPropertyScene ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation DKCustomPropertyScene

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Animation methods
- (void)startAnimate{
    POPBasicAnimation *animation = [POPBasicAnimation animation];
    animation.duration = 10.0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

    animation.fromValue = @(0.0f);
    animation.toValue = @(100.0f);

    POPAnimatableProperty *animatableProperty = [POPAnimatableProperty propertyWithName:@"changeTime" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.name = @"changeTime";
        prop.readBlock = ^(UILabel *label1,CGFloat values[]){
            values[0] = label1.text.floatValue;
        };
        prop.writeBlock = ^(UILabel *label1, const CGFloat values[]){
            label1.text = [NSString stringWithFormat:@"%.2f",values[0]];
        };
        //至今不知道这个属性是干什么的,如果有人知道还请告诉我一下
        prop.threshold = 0.01;
    }];
    animation.property = animatableProperty;

    //动画要加在label上,而不是layer上
    [self.label pop_addAnimation:animation forKey:@"changeTime"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
