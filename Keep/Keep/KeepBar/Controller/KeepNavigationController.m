//
//  KeepNavigationController.m
//  Keep
//
//  Created by TRRogen on 16/4/27.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import "KeepNavigationController.h"

@interface KeepNavigationController ()

@end

@implementation KeepNavigationController
+(void)initialize{
    if (self == [KeepNavigationController class]) {
        /*设置navigationBar*/
        //获取navigationBar的外观
        UINavigationBar *naviBar = [UINavigationBar appearance];
        //设置NavigationBar的背景图
        [naviBar setBackgroundImage:[UIImage imageNamed:@"naviBarBackgroud"] forBarMetrics:UIBarMetricsDefault];
        //设置NavigationBar两边的Item的渲染色
        naviBar.barTintColor = [UIColor whiteColor];
        naviBar.barStyle = UIBarStyleBlack;
        //设置navigationBar标题的位置
//        [naviBar setTitleVerticalPositionAdjustment:2 forBarMetrics:UIBarMetricsDefault];
        //设置navigationBar标题的属性
        NSMutableDictionary *titleAtt = [NSMutableDictionary dictionary];
        titleAtt[NSForegroundColorAttributeName] = [UIColor whiteColor];
        titleAtt[NSFontAttributeName] = [UIFont systemFontOfSize:16];
        naviBar.titleTextAttributes = titleAtt;
        
        /*设置BarButtonItem*/
//        UIBarButtonItem *BarButtonItem = [UIBarButtonItem appearance];
//        BarButtonItem.imageInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    
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
