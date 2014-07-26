//
//  WGTimeLineCell.h
//  ObjcTimeLine
//
//  Created by 王刚 on 14/7/25.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGTimeLineCell : UITableViewCell

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UIView *lineView;
@property (strong, nonatomic) UIView *circleView;

@property (nonatomic) BOOL minor;

@end
