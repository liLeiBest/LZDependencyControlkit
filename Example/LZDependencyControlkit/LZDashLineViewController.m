//
//  LZDashLineViewController.m
//  LZDependencyControlkit_Example
//
//  Created by Dear.Q on 2020/7/27.
//  Copyright © 2020 lilei_hapy@163.com. All rights reserved.
//

#import "LZDashLineViewController.h"

@interface LZDashLineViewController ()

@property (nonatomic, weak) IBOutlet LZDashLineView *dashLineView;

@end

@implementation LZDashLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    
    self.dashLineView.lineColor = [UIColor redColor];
    LZDashLinePosition position =
    LZDashLinePositionHorizontal |
    LZDashLinePositionVertical |
    LZDashLinePositionTop |
    LZDashLinePositionLeft|
    LZDashLinePositionBottom|
    LZDashLinePositionRight
    ;
    self.dashLineView.cornerRadius = 20;
    self.dashLineView.linePsition = position ;
}

@end
