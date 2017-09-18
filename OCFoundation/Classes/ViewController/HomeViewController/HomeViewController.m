//
//  HomeViewController.m
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/13.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import "HomeViewController.h"
@interface HomeViewController ()
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationTitle = @"首页";
    [self setRightBarButtonItemWithTitle:@"下一页" Action:@selector(pushVC)];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 100, 100)];
    view.backgroundColor = [UIColor randomColor];
    [self.view addSubview:view];
}
- (void)pushVC
{
    BaseViewController *demoViewController = [[NSClassFromString(@"DemoViewController") alloc]init];
    [self.navigationController pushViewController:demoViewController animated:YES];
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
