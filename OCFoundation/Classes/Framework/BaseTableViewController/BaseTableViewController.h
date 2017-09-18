//
//  BaseTableViewController.h
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/15.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController

@property (nonatomic,strong)UITableView *mainTableView;// 表格
@property (nonatomic,strong)NSMutableArray *dataArray;// 数据源
@property (nonatomic,assign)NSInteger pageCount;// 页数
@property (nonatomic,assign)NSInteger number;//每页条数

#pragma mark - 上拉加载更多，下拉刷新
/**
 去除上下拉加载
 */
- (void)removedRefreshing;
/**
 隐藏加载更多
 */
- (void)hideLoadMoreRefreshing;
/**
 结束刷新
 */
- (void)endRefreshing;
/**
 刷新表格
 */
- (void)refreshData;

@end
