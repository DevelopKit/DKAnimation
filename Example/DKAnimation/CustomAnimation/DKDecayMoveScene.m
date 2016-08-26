//
//  DKDecayMoveScene.m
//  DKAnimation
//
//  Created by NaCai on 16/8/26.
//  Copyright © 2016年 qiang zhai. All rights reserved.
//

#import "DKDecayMoveScene.h"
#import <pop/POP.h>
@interface DKDecayMoveScene ()
@property (weak, nonatomic) IBOutlet UIView *panView;

@end

@implementation DKDecayMoveScene

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)panAction:(UIPanGestureRecognizer *)sender {
    switch (sender.state){
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateChanged:
        {
            //这里是必须要写的，
            [self.panView.layer pop_removeAllAnimations];
            CGPoint translation = [sender translationInView:self.view];
            CGPoint center = self.panView.center;
            center.x += translation.x;
            center.y += translation.y;
            self.panView.center = center;

            [sender setTranslation:CGPointZero inView:self.panView];
        }
            break;
        case UIGestureRecognizerStateCancelled:
            break;
        case UIGestureRecognizerStateEnded:
        {
            CGPoint velocity = [sender velocityInView:self.view];
            POPDecayAnimation *animation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPosition];
            animation.velocity = [NSValue valueWithCGPoint:velocity];
            [self.panView.layer pop_addAnimation:animation forKey:@"move"];
        }
            break;
        default:
            break;
    }
}

@end
