//
//  LZViewController.m
//  LZDependencyControlkit
//
//  Created by lilei_hapy@163.com on 06/28/2019.
//  Copyright (c) 2019 lilei_hapy@163.com. All rights reserved.
//

#import "LZViewController.h"
#import <LZDependencyControlkit/LZDependencyControlkit.h>

@interface LZViewController () {
	
	IBOutlet LZLoadingButton *loadingView;
}

@end

@implementation LZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setupUI];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	
	[loadingView animationFinish];
	
	[(LZLoadingButton *)self.navigationItem.rightBarButtonItem.customView animationFinish];
}

// MARK: - UI Action
- (void)loadingSomething {
	
	NSLog(@"%s", __PRETTY_FUNCTION__);
}

// MARK: - Private
- (void)setupUI {
	
	NSDictionary *attributes = self.navigationController.navigationBar.titleTextAttributes;
	attributes = attributes?:@{NSFontAttributeName : [UIFont systemFontOfSize:14],
							   NSForegroundColorAttributeName : [UIColor redColor],
							   };
	NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"测试" attributes:attributes];
	LZLoadingButton *loadingBtn = [[LZLoadingButton alloc] initWithTitle:title shapColor:[UIColor clearColor] frame:CGRectMake(0, 0, 80, 30)];
	loadingBtn.circleColor = [attributes objectForKey:NSForegroundColorAttributeName];
	loadingBtn.maskColor = [UIColor orangeColor];
	loadingBtn.loadColor = [attributes objectForKey:NSForegroundColorAttributeName];
	[loadingBtn addTarget:self action:@selector(loadingSomething)];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:loadingBtn];
	
	loadingView.attributedTitle = title;
	loadingView.shapeColor = [UIColor redColor];
	loadingView.circleColor = [attributes objectForKey:NSForegroundColorAttributeName];;
	loadingView.maskColor = [UIColor magentaColor];
	loadingView.loadColor = [attributes objectForKey:NSForegroundColorAttributeName];;
	[loadingView addTarget:self action:@selector(loadingSomething)];
}

@end
