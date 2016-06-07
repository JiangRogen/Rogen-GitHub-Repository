//
//  TrainDetailCell.m
//  Keep
//
//  Created by TRRogen on 16/5/22.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import "TrainDetailCell.h"

@implementation TrainDetailCell


-(instancetype)init{
    self = [super init];
    if (self) {
        [self awakeFromNib];
        
    }
    return self;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
