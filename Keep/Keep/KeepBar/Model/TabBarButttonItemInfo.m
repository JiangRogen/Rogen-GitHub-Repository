//
//  TabBarButttonItemInfo.m
//  Keep
//
//  Created by TRRogen on 16/5/22.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import "TabBarButttonItemInfo.h"

@implementation TabBarButttonItemInfo

+(instancetype)barButtonItemInfoWithDictionary:(NSDictionary*)dict{
    return [[self alloc]initWithDictionary:dict];
}

-(instancetype)initWithDictionary:(NSDictionary*)dict{
    self = [super init];
    if (self) {
        self.title = dict[@"title"];
        self.normalImage =[[UIImage imageNamed:dict[@"normalImageName"]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.selectedImage = [[UIImage imageNamed:dict[@"selectedImageName"]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        self.selectedImage = [UIImage imageNamed:dict[@"selectedImageName"]];

    }
    return self;
}
@end
