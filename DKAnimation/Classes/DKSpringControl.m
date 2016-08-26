//
//  DKSpringControl.m
//  Pods
//
//  Created by NaCai on 16/8/23.
//
//

#import "DKSpringControl.h"

@implementation DKSpringControl

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
}

- (void)_setup{
    [self addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchDragExit];
    [self addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchDragEnter];

}

- (void)handleAction:(UIControl *)sender withEvent:(UIEvent *)event{
    
}
- (void (^)(CGFloat to,CGFloat from))scaleTo{
    
}
@end
