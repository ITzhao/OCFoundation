//
//  BaseCollectionViewController.m
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/15.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import "BaseCollectionViewController.h"
#import "UIScrollView+EmptyDataSet.h"
#import "MJRefresh.h"

@interface BaseCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property (nonatomic,strong)UICollectionViewFlowLayout *flowLayout;//默认布局
@end

@implementation BaseCollectionViewController
- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}
#pragma mark - 懒加载
- (UICollectionView *)mainCollectionView
{
    if (!_mainCollectionView) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _mainCollectionView  = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, K_Screen_width, K_Screen_height) collectionViewLayout:_flowLayout];
        _mainCollectionView.delegate = self;
        _mainCollectionView.dataSource = self;
        _mainCollectionView.scrollsToTop = YES;
        _mainCollectionView.emptyDataSetSource = self;
        _mainCollectionView.emptyDataSetDelegate = self;
        _mainCollectionView.showsVerticalScrollIndicator = NO;
        _mainCollectionView.showsHorizontalScrollIndicator = NO;
        _mainCollectionView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
        _mainCollectionView.backgroundColor = [UIColor whiteColor];
        _mainCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadNewData)];
        _mainCollectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(reloadMoreData)];
        [_mainCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    }
    return _mainCollectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _pageCount = 1;
    _number = 10;
    [self.view insertSubview:self.mainCollectionView belowSubview:self.navigationBar];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor randomColor];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
#pragma mark - 网络请求 (子类重写)
- (void)requestData
{
    [self endRefreshing];
}
#pragma mark - 上下拉获取数据
- (void)reloadNewData
{
    _pageCount = 1;
    [self requestData];
}
- (void)reloadMoreData
{
    _pageCount ++;
    [self requestData];
}
- (void)removedRefreshing
{
    self.mainCollectionView.mj_header = nil;
    self.mainCollectionView.mj_footer = nil;
}
- (void)endRefreshing
{
    [self.mainCollectionView.mj_header endRefreshing];
    [self.mainCollectionView.mj_footer endRefreshing];
}
- (void)hideLoadMoreRefreshing
{
    self.mainCollectionView.mj_footer.hidden = YES;
}
- (void)refreshData
{
    [self.mainCollectionView reloadData];
}
#pragma mark - DZNEmptyDataSetSource

/**
 *  返回标题文字
 */
/*
 - (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
 {
 NSString *text = @"这是标题";
 return [[NSAttributedString alloc]initWithString:text];
 }
 */
/**
 *  返回文字详情
 */
/*
 - (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
 {
 NSString *text = @"这只一段短描述";
 NSMutableAttributedString *attribuString = [[NSMutableAttributedString alloc]initWithString:text attributes:nil];
 [attribuString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:12] range:[attribuString.string rangeOfString:@"哈哈哈"]];
 return attribuString;
 }
 */
/**
 *  返回文字按钮
 */
/*
 - (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
 {
 NSString *text = @"点我重新加载";
 UIFont *font = [UIFont systemFontOfSize:15];
 UIColor *color = [UIColor redColor];
 NSMutableDictionary *attributedString = [[NSMutableDictionary alloc]init];
 [attributedString setObject:font forKey:NSFontAttributeName];
 [attributedString setObject:color forKey:NSForegroundColorAttributeName];
 return [[NSAttributedString alloc]initWithString:text attributes:attributedString];
 }
 */
/**
 *  返回图片按钮
 */

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return [UIImage imageNamed:@"nodata"];
}
/**
 *  调整垂直位置
 */
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return -64.f;
}
#pragma mark - DZNEmptyDataSetDelegate
/**
 *  数据源为空渲染和显示（默认是YES）
 */
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return YES;
}

/**
 *  是否允许点击（默认是YES）
 */
- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    return YES;
}
/**
 *  是否允许滚动（默认是NO）
 */
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return NO;
}
/**
 *  空白区域点击事件
 */
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    
}
/**
 *  点击按钮事件处理
 */
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    [self.mainCollectionView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
