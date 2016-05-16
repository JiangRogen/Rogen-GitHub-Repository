//
//  HeadCell.m
//  Keep
//
//  Created by TRRogen on 16/4/25.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import "HeadCell.h"
#import "UIView+RoundCut.h"
@implementation HeadCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cellHeight:(CGFloat)height{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        /*创建头像视图view*/
        UIImageView *headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 5, height-10, height-10)];
        headImageView.image = [UIImage imageNamed:@"personal_on"];
        headImageView.contentMode = UIViewContentModeScaleAspectFit;
        [headImageView roundCutCornerRadius:20 borderWidth:1 borderColor:[UIColor lightGrayColor]];
        [self.contentView addSubview:headImageView];
        headImageView.userInteractionEnabled = YES;
        self.headImageView = headImageView;
        /*创建昵称label*/
        CGFloat X = headImageView.frame.origin.x + headImageView.frame.size.width + 10;
        CGFloat Y = height * 0.2;
        UILabel *nickName = [[UILabel alloc]initWithFrame:CGRectMake(X, Y, self.contentView.bounds.size.width, 30)];
        nickName.text = @"TRJiangLilong";
        nickName.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:nickName];

    }
    return self;
}



@end
