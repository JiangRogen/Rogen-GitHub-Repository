//
//  KeepTabBarController.m
//  Keep
//
//  Created by TRRogen on 16/4/22.
//  Copyright © 2016年 TRRogen. All rights reserved.
//
#import "KeepTabBarController.h"
#import "KeepBarManager.h"

@interface KeepTabBarController ()

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
    
    //在TabBar的上面加一个灰色的分隔条
    UIView *topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tabBar.frame.size.width,1)];
    topLine.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    [self.tabBar addSubview:topLine];
    
    [self setChildViewControllersBarItem];
    
}

-(void)setChildViewControllersBarItem{
    NSArray<UIViewController*> *allChildVC = self.childViewControllers;
    NSInteger count = allChildVC.count;
    KeepBarManager *barMgr = [KeepBarManager sharedKeepBarManager];
    for (int i = 0; i<count; i++) {
        TabBarButttonItemInfo *itemInfo = [barMgr getTabBarButttonItemInfoWithIndex:i];
        allChildVC[i].tabBarItem = [[UITabBarItem alloc]initWithTitle:itemInfo.title image:itemInfo.normalImage selectedImage:itemInfo.selectedImage];
    }
}



@end
