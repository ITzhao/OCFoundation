//
//  DemoViewController.m
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/14.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationTitle = @"整体返回";
    [self setLeftBarItemWithTitle:@"首页"];
    self.view.backgroundColor = [UIColor randomColor];
    // 调整tableView的布局
    self.mainTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.dataArray = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""].mutableCopy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
