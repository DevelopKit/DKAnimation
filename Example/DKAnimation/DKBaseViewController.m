//
//  DKBaseViewController.m
//  DKAnimation
//
//  Created by NaCai on 16/8/26.
//  Copyright © 2016年 qiang zhai. All rights reserved.
//

#import "DKBaseViewController.h"

@interface DKBaseViewController ()

@end

@implementation DKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self startAnimate];
}

-(void)startAnimate{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
