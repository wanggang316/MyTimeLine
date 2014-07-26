//
//  WGTimeLineHeaderView.m
//  ObjcTimeLine
//
//  Created by 王刚 on 14/7/26.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "WGTimeLineHeaderView.h"

@implementation WGTimeLineHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.95];
        [self addSubview:self.titleLabel];
        [self addSubview:self.lineView];
        
        NSDictionary *views = [NSDictionary dictionaryWithObjectsAndKeys:self.titleLabel, @"titleLabel", self.lineView, @"lineView", nil];
        NSDictionary *metrics = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:8], @"verticalMargin", nil];
    
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[titleLabel]|" options:NSLayoutFormatDirectionMask metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(verticalMargin)-[titleLabel]-(verticalMargin)-[lineView(1)]|" options:NSLayoutFormatDirectionMask metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[lineView]|" options:NSLayoutFormatDirectionMask metrics:metrics views:views]];
        
        
    }
    return self;
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        _titleLabel.font = [UIFont fontWithName:@"Avenir" size:18];
        _titleLabel.textColor = [UIColor colorWithRed:0.514 green:0.525 blue:0.541 alpha:1];
    }
    return _titleLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        [_lineView setTranslatesAutoresizingMaskIntoConstraints:NO];
        _lineView.backgroundColor = [UIColor colorWithRed:0.906 green:0.914 blue:0.918 alpha:1];
    }
    return _lineView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
