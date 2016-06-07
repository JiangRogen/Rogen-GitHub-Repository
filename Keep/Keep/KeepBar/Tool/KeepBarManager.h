//
//  KeepBarManager.h
//  Keep
//
//  Created by TRRogen on 16/5/21.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TabBarButttonItemInfo.h"

@interface KeepBarManager : NSObject


+(instancetype)sharedKeepBarManager;

-(TabBarButttonItemInfo*)getTabBarButttonItemInfoWithIndex:(NSInteger)index;

@end
