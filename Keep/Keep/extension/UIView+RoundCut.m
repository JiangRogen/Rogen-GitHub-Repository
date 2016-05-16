//
//  UIView+RoundCut.m
//  Keep
//
//  Created by TRRogen on 16/5/7.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import "UIView+RoundCut.h"

@implementation UIView (RoundCut)

-(void)roundCutCornerRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor*)color{
    //断言,当圆角的半径不能大于frame长或宽的一半时,自动报错
    assert(radius<= self.bounds.size.width*0.5 && radius <= self.bounds.size.height*0.5);
    self.layer.cornerRadius = radius;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
    self.layer.masksToBounds = YES;
}

-(void)roundCutCornerRadius:(CGFloat)radius{
    [self roundCutCornerRadius:radius borderWidth:0 borderColor:nil];
}

-(void)roundCutborderWidth:(CGFloat)width borderColor:(UIColor *)color{
    //断言,当frame的长宽不相等时自动报错
    assert(self.bounds.size.width ==  self.bounds.size.height);
    [self roundCutCornerRadius:self.bounds.size.width*0.5 borderWidth:width borderColor:color];
    
}
-(void)roundCut{
    [self roundCutborderWidth:0 borderColor:nil];
}
@end
