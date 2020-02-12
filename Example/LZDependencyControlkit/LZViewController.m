//
//  LZViewController.m
//  LZDependencyControlkit
//
//  Created by lilei_hapy@163.com on 06/28/2019.
//  Copyright (c) 2019 lilei_hapy@163.com. All rights reserved.
//

#import "LZViewController.h"

@interface LZViewController () {
	
	IBOutlet LZLoadingButton *loadingView;
	IBOutlet LZSegmentControl *segmentControl;
    IBOutlet LZFixedButton *topTitleBtn;
    IBOutlet LZFixedButton *leftTitleBtn;
    IBOutlet LZFixedButton *bottomTitleBtn;
}

@end

@implementation LZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setupUI];
}

// MARK: - UI Action
- (IBAction)stopLoadingDidTouchDown:(id)sender {
	
	[loadingView animationFinish];
	[(LZLoadingButton *)self.navigationItem.rightBarButtonItem.customView animationFinish];
}

- (void)loadingSomething {
	NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (IBAction)fixedBtnDidTouch:(UIButton *)sender {
    sender.selected = !sender.selected;
}

// MARK: - Private
- (void)setupUI {
	
	[self configLoadingButton];
	[self configSegmentView];
    [self configFixedBtn];
}

- (void)configLoadingButton {
	
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

- (void)configSegmentView {
	
	LZSegmentItemModel *item0 = [LZSegmentItemModel itemWithTitle:@"你好" atIndex:0];
	LZSegmentItemModel *item1 = [LZSegmentItemModel itemWithTitle:@"我好" atIndex:1];
	LZSegmentItemModel *item2 = [LZSegmentItemModel itemWithTitle:@"大家好" atIndex:2];
	
	[segmentControl updateItems:@[item0, item1, item2, item0, item1, item2]];
}

- (void)configFixedBtn {
    
    topTitleBtn.titlePosition = LZFixedButtonTitlePositionTop;
    topTitleBtn.titleProportionInButton = 0.5;
    
    leftTitleBtn.titlePosition = LZFixedButtonTitlePositionLeft;
    leftTitleBtn.titleProportionInButton = 0.55;
    
    bottomTitleBtn.titlePosition = LZFixedButtonTitlePositionBottom;
    bottomTitleBtn.titleProportionInButton = 0.7;
}

@end
