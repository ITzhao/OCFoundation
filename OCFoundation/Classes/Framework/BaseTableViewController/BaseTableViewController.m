//
//  BaseTableViewController.m
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/15.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import "BaseTableViewController.h"
#import "UIScrollView+EmptyDataSet.h"
#import "MJRefresh.h"


@interface BaseTableViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property (nonatomic, getter=isLoading)BOOL loading;

@end

@implementation BaseTableViewController
- (void)setLoading:(BOOL)loading
{
    if (self.loading == loading) {
        return;
    }
    _loading = loading;
    [self.mainTableView reloadEmptyDataSet];
}
- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}
#pragma mark - 懒加载
- (UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, K_Screen_width, K_Screen_height) style:UITableViewStyleGrouped];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.scrollsToTop = YES;
        _mainTableView.emptyDataSetSource = self;
        _mainTableView.emptyDataSetDelegate = self;
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.showsHorizontalScrollIndicator = NO;
        _mainTableView.backgroundColor = [UIColor whiteColor];
        _mainTableView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
        _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadNewData)];
        _mainTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(reloadMoreData)];
    }
    return _mainTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageCount = 1;
    _number = 10;
    self.dataArray = @[@""].mutableCopy;// 防止刚进入页面时显示出占位图
    [self.view insertSubview:self.mainTableView belowSubview:self.navigationBar];
    [self requestData];
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
    self.mainTableView.mj_header = nil;
    self.mainTableView.mj_footer = nil;
}
- (void)endRefreshing
{
    [self.mainTableView.mj_header endRefreshing];
    [self.mainTableView.mj_footer endRefreshing];
}
- (void)hideLoadMoreRefreshing
{
    self.mainTableView.mj_footer.hidden = YES;
}
- (void)refreshData
{
    [self.mainTableView reloadData];
}
#pragma mark - TableViewDelegate dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0001;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell_id = @"falg";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld分区%ld行",indexPath.section,indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - DZNEmptyDataSetSource
/**
 *  返回文字详情
 */
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"点击图片重新加载";
    NSMutableAttributedString *attribuString = [[NSMutableAttributedString alloc]initWithString:text attributes:nil];
    [attribuString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PF-SC-Regular" size:12] range:[attribuString.string rangeOfString:@"哈哈哈"]];
    return attribuString;
}
/**
 *  调整垂直位置
 */
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"zhanwei"];
}
//返回loading的状态
- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView
{
    return self.isLoading;
}
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return -64.f;
}
#pragma mark - DZNEmptyDataSetDelegate
/**
 *  空白区域点击事件
 */
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    /*
     动画效果
         self.loading = YES;
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             self.loading = NO;
         });
         [self requestData];
     */
// 刷新
    [self.mainTableView.mj_header beginRefreshing];
}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0) ];
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    return animation;
}

@end
