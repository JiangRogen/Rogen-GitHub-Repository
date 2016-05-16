//
//  HeadImageViewController.h
//  Keep
//
//  Created by TRRogen on 16/5/7.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^imageBlock)(UIImage* );
@interface HeadImageViewController : UIViewController
@property(nonatomic,strong)UIImage *headImage;
@property(nonatomic,strong)imageBlock modifyHeadImage;
@end
