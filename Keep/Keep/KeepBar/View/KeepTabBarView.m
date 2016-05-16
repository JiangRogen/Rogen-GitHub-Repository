//
//  KeepTabBarView.m
//  Keep
//
//  Created by TRRogen on 16/4/23.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import "KeepTabBarView.h"

@interface KeepTabBarView ()
{
    __weak UIButton *_selectedBtn;
    CGFloat _barWidth;
    CGFloat _barHeight;
    //barButton的参数
    UIEdgeInsets _barButtonsInsert;
    CGFloat _barButtonInterval;
    CGFloat _barButtonHeight;
    NSInteger _btnCount;

}
@end
@implementation KeepTabBarView

//定义初始化方法
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //在TabBar的上面加一个灰色的分隔条
        UIView *topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width,1)];
        topLine.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
        [self addSubview:topLine];
        //初始化buttons数据
        _barWidth = frame.size.width;
        _barHeight = frame.size.height;
        _barButtonsInsert = UIEdgeInsetsMake(1, 2, 1, 2);
        _barButtonInterval = 3;
        _barButtonHeight = _barHeight - _barButtonsInsert.top - _barButtonsInsert.bottom;
       
    }
    return self;
}


//根据字典数据添加TabBarButton
-(void)addTabButtonWithDict:(NSDictionary *)dict{
    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置barButton的文字
    [barButton setTitle:dict[@"title"] forState:UIControlStateNormal];
    [barButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [barButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
//    [barButton setTitleEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    //设置button的Image;
    UIImage *normalImage =[[UIImage imageNamed:dict[@"normalImageName"]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage =[[UIImage imageNamed:dict[@"hightlightImageName"]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [barButton setImage:normalImage forState:UIControlStateNormal];
    [barButton setImage:selectedImage forState:UIControlStateSelected];
    //    [barButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    [barButton setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateSelected];
    //添加button
    [self addSubview:barButton];  
    //添加点击事件
    [barButton addTarget:self action:@selector(clickTabBarButton:) forControlEvents:UIControlEventTouchUpInside];
    barButton.tag = _btnCount;
    _btnCount++;
    //将第一个添加的按钮设置为选中状态
    if (1 == _btnCount) {
        [self clickTabBarButton:barButton];
    }
}
//点击按钮后要做的事
-(void)clickTabBarButton:(UIButton*)sender{
    //将将上一个button的状态改为没有选中的状态,并将选中的button改为当前选中的button
    _selectedBtn.selected = NO;
    _selectedBtn = sender;
    //设置当前选中的button为选状态
    sender.selected = YES;
    //跳到选中的VC,需要使用代理tabBarController来做
    //先判断代理方法是否实现
    if ([self.delegate respondsToSelector:@selector(KeepTabBarView:SelectedIndex:toIndex:)]) {
        [self.delegate KeepTabBarView:self SelectedIndex:_selectedBtn.tag toIndex:sender.tag];
    }
}

//布局子视图的方法,(注意要加载super方法),该方法是在所有子视图都加载完以后调用
-(void)layoutSubviews{
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    CGFloat barButtonWidth = (_barWidth- _barButtonsInsert.left - _barButtonsInsert.right - _barButtonInterval*(_btnCount-1))/_btnCount;
    
    for (NSInteger i =0 ,n = 0; i<count; i++) {
        if ([self.subviews[i] isMemberOfClass:[UIButton class]]){
            CGFloat barButtonX = _barButtonsInsert.left + (n++)*(barButtonWidth +_barButtonInterval);
            self.subviews[i].frame = CGRectMake(barButtonX, _barButtonsInsert.top, barButtonWidth, _barButtonHeight);
        }
    }

}


@end
