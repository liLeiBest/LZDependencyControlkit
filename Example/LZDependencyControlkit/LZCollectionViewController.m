//
//  LZCollectionViewController.m
//  LZDependencyControlkit_Example
//
//  Created by Dear.Q on 2019/8/11.
//  Copyright © 2019 lilei_hapy@163.com. All rights reserved.
//

#import "LZCollectionViewController.h"

@interface LZCollectionViewController ()<UICollectionViewDelegateFlowLayout, LZCollectionViewWaterfallFlowLayoutDelegate>

@property (strong, nonatomic) NSMutableArray *cellHeightArrM;

@end

@implementation LZCollectionViewController

// MARK: - Lazy Loading
- (NSMutableArray *)cellHeightArrM {
	if (nil == _cellHeightArrM) {
		_cellHeightArrM = [NSMutableArray array];
	}
	return _cellHeightArrM;
}

// MARK: - Initialization
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self configCellAlignFlowLayout];
}

// MARK: - Private
- (void)configCellAlignFlowLayout {
	
	LZCollectionViewAlignCellFlowLayout *flowLayout = [[LZCollectionViewAlignCellFlowLayout alloc] init];
	flowLayout.aligment = LZFlowLayoutCellAlignmentCenter;
	flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
	self.collectionView.collectionViewLayout = flowLayout;
	self.collectionView.alwaysBounceVertical = NO;
	self.collectionView.alwaysBounceHorizontal = NO;
}

- (void)configWaterfallFlowLayout {
	
	LZCollectionViewWaterfallFlowLayout *flowLayout = [[LZCollectionViewWaterfallFlowLayout alloc] init];
	flowLayout.delegate = self;
	flowLayout.rowMargin = 10;
	flowLayout.columnMargin = 18;
	flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
	self.collectionView.collectionViewLayout = flowLayout;
}

// MARK: - Delegate
// MARK: <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	
	NSUInteger itemCount = 10;
	for (int i = 0; i < itemCount; i++) {
		
		CGFloat height = (arc4random()%100) + 20;
		[self.cellHeightArrM addObject:@(height)];
	}
    return itemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
				  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
    UICollectionViewCell *cell =
	[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
	cell.contentView.backgroundColor =
	[UIColor colorWithRed:(arc4random()%255)/255.0
					green:(arc4random()%255)/255.0
					 blue:(arc4random()%255)/255.0
					alpha:1];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
		   viewForSupplementaryElementOfKind:(NSString *)kind
								 atIndexPath:(NSIndexPath *)indexPath {

	if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
		return [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
	} else {
		return [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer" forIndexPath:indexPath];
	}
}

// MARK: <UICollectionViewDelegateFlowLayout>
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
	return UIEdgeInsetsMake(20, 10, 20, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
	return CGSizeMake(0, 20);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
	return CGSizeMake(0, 20);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return CGSizeMake([self.cellHeightArrM[indexPath.row] integerValue], 500);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
	return 20;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
	return 30;
}

// MARK: <LZCollectionViewWaterfallFlowLayoutDelegate>
- (CGFloat)waterfallFlowLayout:(LZCollectionViewWaterfallFlowLayout *)waterfallFlowLayout
				heightForWidth:(CGFloat)width
				   atIndexPath:(NSIndexPath *)indexPath {
	return [self.cellHeightArrM[indexPath.row] integerValue];
}

- (CGSize)waterfallFlowLayout:(LZCollectionViewWaterfallFlowLayout *)waterfallFlowLayout
referenceSizeForHeaderInSection:(NSInteger)section {
	return CGSizeMake(0, 20);
}

- (CGSize)waterfallFlowLayout:(LZCollectionViewWaterfallFlowLayout *)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section {
	return CGSizeMake(0, 20);
}

@end
