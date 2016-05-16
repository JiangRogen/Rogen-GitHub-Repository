//
//  HeadCell.h
//  Keep
//
//  Created by TRRogen on 16/4/25.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface HeadCell : UITableViewCell
@property(nonatomic,weak)UIImageView *headImageView;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cellHeight:(CGFloat)height;
@end
