//
//  KeepTabBarView.h
//  Keep
//
//  Created by TRRogen on 16/4/23.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KeepTabBarView;
//定义代理用于返回点中的index
@protocol KeepTabBarViewDelegate <NSObject>

-(void)KeepTabBarView:(KeepTabBarView*)tabBar SelectedIndex:(NSInteger)selectedIndex toIndex:(NSInteger)index;

@end

@interface KeepTabBarView : UIView

@property(nonatomic,weak)id<KeepTabBarViewDelegate> delegate;
//根据传过来的字典创建button
-(void)addTabButtonWithDict:(NSDictionary*)dict;

@end
