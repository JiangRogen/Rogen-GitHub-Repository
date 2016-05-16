//
//  DynamicCellView.m
//  Keep
//
//  Created by TRRogen on 16/4/24.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import "DynamicCell.h"

@interface DynamicCell ()
{
    CGFloat _width;
    CGFloat _height;
}
@end


@implementation DynamicCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _width = CGRectGetWidth(frame)/3;
        _height = CGRectGetHeight(frame);
        NSArray *arr = @[@"动态",@"关注",@"粉丝"];
        for (int i = 0; i < 3; i++) {
            UIButton *button = [[UIButton alloc]init];
            [button setTitle:arr[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            button.frame = CGRectMake(_width*i, 0, _width, _height);
            [self addSubview:button];
        }
    }
    return self;
}
//-(void)layoutSubviews{
//    for (int i = 0; i<3; i++) {
//        UIButton *button= [self viewWithTag:i];
//        
//    }
//}
@end
