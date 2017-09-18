//
//  BaseCollectionViewController.h
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/15.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseCollectionViewController : BaseViewController
@property (nonatomic,strong)UICollectionView *mainCollectionView;
@property (nonatomic,strong)NSMutableArray *dataArray;// 数据源
@property (nonatomic,assign)NSInteger pageCount;//控制当前页数
@property (nonatomic,assign)NSInteger number;//每页条数

#pragma mark - 上下拉刷新

/**
 去除上下拉加载
 */
- (void)removedRefreshing;

/**
 结束刷新
 */
- (void)endRefreshing;

/**
 隐藏加载更多
 */
- (void)hideLoadMoreRefreshing;

/**
 刷新表格
 */
- (void)refreshData;

@end
