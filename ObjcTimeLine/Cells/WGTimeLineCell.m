//
//  WGTimeLineCell.m
//  ObjcTimeLine
//
//  Created by 王刚 on 14/7/25.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "WGTimeLineCell.h"

@implementation WGTimeLineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self.minor = NO;
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.circleView];
        
        NSDictionary *views = [NSDictionary dictionaryWithObjectsAndKeys:self.timeLabel, @"timeLabel", self.titleLabel, @"titleLabel", self.lineView, @"lineView", self.circleView, @"circleView", nil];
    
        
        NSDictionary *metrics = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:12], @"margin", [NSNumber numberWithInt:16], @"leftMargin", [NSNumber numberWithInt:14], @"lineMargin", nil];
        
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-(leftMargin)-[timeLabel(80)]-(lineMargin)-[lineView(2)]-(lineMargin)-[titleLabel]-|" options:NSLayoutFormatDirectionMask metrics:metrics views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[titleLabel]-(margin)-|" options:NSLayoutFormatDirectionMask metrics:metrics views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[lineView]|" options:NSLayoutFormatDirectionMask metrics:metrics views:views]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.lineView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.circleView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.lineView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.circleView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.titleLabel attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.circleView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:14]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.circleView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:14]];
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        _titleLabel.font = [UIFont fontWithName:@"Avenir" size:16];
    }
    return _titleLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        [_timeLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        _timeLabel.font = [UIFont fontWithName:@"Avenir-Light" size:16];
        _timeLabel.textColor = [UIColor colorWithRed:0.631 green:0.651 blue:0.678 alpha:1];
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        [_lineView setTranslatesAutoresizingMaskIntoConstraints:NO];
        _lineView.backgroundColor = [UIColor colorWithRed:0.906 green:0.914 blue:0.918 alpha:1];
    }
    return _lineView;
}

- (UIView *)circleView {
    if (!_circleView) {
        _circleView = [[UIView alloc]init];
        _circleView.backgroundColor = [UIColor whiteColor];
        _circleView.layer.borderWidth = 1;
        _circleView.layer.cornerRadius = 7;
    }
    return _circleView;
}

- (void)setMinor:(BOOL)minor {

    _titleLabel.textColor = (minor ? _timeLabel.textColor : [UIColor colorWithRed:0.227 green:0.227 blue:0.278 alpha:1]);
    _circleView.layer.borderColor = (minor ? [[UIColor colorWithRed:0.839 green:0.847 blue:0.851 alpha:1] CGColor] : [[UIColor colorWithRed:0.329 green:0.831 blue:0.690 alpha:1] CGColor]);
    
}

@end
