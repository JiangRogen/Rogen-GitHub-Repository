//
//  UIView+RoundCut.h
//  Keep
//
//  Created by TRRogen on 16/5/7.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RoundCut)

//圆角矩形剪切,需要边线
-(void)roundCutCornerRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor*)color;
//圆角矩形剪切
-(void)roundCutCornerRadius:(CGFloat)radius;
//圆形剪切,需要边线
-(void)roundCutborderWidth:(CGFloat)width borderColor:(UIColor *)color;
//圆形剪切
-(void)roundCut;
@end
