//
//  KeepBarManager.m
//  Keep
//
//  Created by TRRogen on 16/5/21.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import "KeepBarManager.h"

@interface KeepBarManager ()
@property(nonatomic,strong)NSArray<TabBarButttonItemInfo*> *allTabBarButttonItemInfo;

@end


@implementation KeepBarManager

//all tab bar items lazy load
-(NSArray<TabBarButttonItemInfo*> *)allTabBarButttonItemInfo{
    if (!_allTabBarButttonItemInfo) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"tabBarButtons.plist" ofType:nil];
        NSArray<NSDictionary*> *itemsDict = [NSArray arrayWithContentsOfFile:path];
        NSInteger count = itemsDict.count;
        NSMutableArray<TabBarButttonItemInfo*> *itemsModel = [NSMutableArray arrayWithCapacity:count];
        for (NSDictionary *dic in itemsDict) {
            [itemsModel addObject:[TabBarButttonItemInfo barButtonItemInfoWithDictionary:dic]];
        }
        _allTabBarButttonItemInfo = [itemsModel copy];
    }
    return _allTabBarButttonItemInfo;
}

-(TabBarButttonItemInfo*)getTabBarButttonItemInfoWithIndex:(NSInteger)index{
    return self.allTabBarButttonItemInfo[index];
}



+(instancetype)sharedKeepBarManager{
    static KeepBarManager *_barMgr = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _barMgr = [[KeepBarManager alloc]init];
    });
    return _barMgr;
}

@end
