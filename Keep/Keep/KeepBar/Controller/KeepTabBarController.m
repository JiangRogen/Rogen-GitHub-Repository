//
//  KeepTabBarController.m
//  Keep
//
//  Created by TRRogen on 16/4/22.
//  Copyright © 2016年 TRRogen. All rights reserved.
//
#import "KeepTabBarController.h"
#import "TrainViewController.h"
#import "DiscoveryViewController.h"
#import "TrendsViewController.h"
#import "PersionalViewController.h"
#import "KeepNavigationController.h"
#import "KeepTabBarView.h"
@interface KeepTabBarController ()<KeepTabBarViewDelegate>
@property(nonatomic,strong)NSArray<NSDictionary*> *tabBarBtnsInfo;
@end

@implementation KeepTabBarController
//initialize方法中设置统一外观
+(void)initialize{
    if (self == [KeepTabBarController class]) {
        /*设置TabBar的统一样式*/
        UITabBar *tabBar = [UITabBar appearance];
        tabBar.barTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        tabBar.translucent = NO;  //设置tabBar为不透明
        tabBar.selectionIndicatorImage = [UIImage imageNamed:@"tabBarSelectedButton"];
        tabBar.tintColor = [UIColor grayColor];
       
        /*设置TabBarItem的统一样式*/
        UITabBarItem *tabBarItem = [UITabBarItem appearance];
        tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -5); //设置偏移量
        //设置normal状态下的字体属性
        NSMutableDictionary *normalTitleAtt = [NSMutableDictionary dictionary];
        normalTitleAtt[NSForegroundColorAttributeName] = [UIColor colorWithRed:198/255.0 green:197/255.0 blue:198/255.0 alpha:204/255.0];
        //设置Selected状态下的字体属性
        NSMutableDictionary *selectedTitleAtt = [NSMutableDictionary dictionary];
        selectedTitleAtt[NSForegroundColorAttributeName] = [UIColor colorWithRed:50/255.0 green:40/255.0 blue:60/255.0 alpha:204/255.0];
        
        [tabBarItem setTitleTextAttributes:normalTitleAtt forState:UIControlStateNormal];
        [tabBarItem setTitleTextAttributes:selectedTitleAtt forState:UIControlStateSelected];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%s",__func__);  //打印出当前的方法
//    NSLog(@"%@",self.view.subviews);  //打印出所有子视图和其frame
    
    [self addChildViewControllers];   //添加所有的Child View Controller
    //在TabBar的上面加一个灰色的分隔条
    UIView *topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tabBar.frame.size.width,1)];
    topLine.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    [self.tabBar addSubview:topLine];
    
    //创建一个用于替代TabBar的view
//    self.selectedIndex =0;   //设置当前选中的下标为0;
//    KeepTabBarView *tabBarView = [[KeepTabBarView alloc]initWithFrame:self.tabBar.frame];       //创建自定义TabBar
//    [self.view addSubview:tabBarView];  //添加自定义TabBar
//    [self.tabBar removeFromSuperview];  //将系统原有的tabBar删除
//    tabBarView.delegate = self;   //设置代理
//    //循环添加tabbarbutton
//    NSInteger count = self.tabBarBtnsInfo.count;
//    for (NSInteger i = 0; i<count ; i++) {
//        [tabBarView addTabButtonWithDict:self.tabBarBtnsInfo[i]];
//    }

}



//数据懒加载
-(NSArray<NSDictionary *> *)tabBarBtnsInfo{
    if (!_tabBarBtnsInfo) {
        _tabBarBtnsInfo = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"tabBarButtons.plist" ofType:nil]];
    }
    return _tabBarBtnsInfo;
}

//为tabBarViewController添加子VC
-(void)addChildViewControllers{
    NSArray<UIViewController*> *ChildControllers = @[[TrainViewController new],[DiscoveryViewController new],[TrendsViewController new],[PersionalViewController new]];
    for (int i = 0; i<self.tabBarBtnsInfo.count; i++) {
        NSDictionary *dic = self.tabBarBtnsInfo[i];
        //添加子控制器
        KeepNavigationController *navi = [[KeepNavigationController alloc]initWithRootViewController:ChildControllers[i]];
        //根据字典设置tabBarItem
        UIImage *image = [[UIImage imageNamed:dic[@"normalImageName"]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectedImage = [[UIImage imageNamed:dic[@"hightlightImageName"]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navi.tabBarItem = [[UITabBarItem alloc]initWithTitle:dic[@"title"] image:image selectedImage:selectedImage];
        [self addChildViewController:navi];
    }
}



#pragma -mark KeepTabBarViewDelegate
//实现代理方法
-(void)KeepTabBarView:(KeepTabBarView *)tabBar SelectedIndex:(NSInteger)selectedIndex toIndex:(NSInteger)index{
    self.selectedIndex = index;   //设置当前界面的下标
}





@end
