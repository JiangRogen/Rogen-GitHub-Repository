//
//  TabBarButttonItemInfo.h
//  Keep
//
//  Created by TRRogen on 16/5/22.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TabBarButttonItemInfo : NSObject
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)UIImage *normalImage;
@property(nonatomic,strong)UIImage *selectedImage;

-(instancetype)initWithDictionary:(NSDictionary*)dict;
+(instancetype)barButtonItemInfoWithDictionary:(NSDictionary*)dict;
@end
