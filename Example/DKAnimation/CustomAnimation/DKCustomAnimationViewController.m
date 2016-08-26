//
//  DKCustomAnimationViewController.m
//  DKAnimation
//
//  Created by NaCai on 16/8/23.
//  Copyright © 2016年 qiang zhai. All rights reserved.
//

#import "DKCustomAnimationViewController.h"
#import <pop/POP.h>

@interface DKCustomAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *mainView;

@end

@implementation DKCustomAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    POPAnimatableProperty *property = [POPAnimatableProperty propertyWithName:@"name" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.readBlock = ^(CALayer *layer, CGFloat values[]) {
            values[0] = [(CALayer *)layer position].y;
            values[1] = layer.opacity;
        };
        prop.writeBlock = ^(CALayer *layer, const CGFloat values[]) {
            CGPoint p = [(CALayer *)layer position];
            p.y = -100;
            [layer setPosition:p];
            [layer setOpacity:0];
        };
        prop.threshold = 1.0f;
    }];
    POPBasicAnimation *an = [POPBasicAnimation animation];
    an.property = property;
    an.repeatForever = YES;
    an.autoreverses = YES;
    an.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    [self.mainView.layer pop_addAnimation:an forKey:@"animation"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
