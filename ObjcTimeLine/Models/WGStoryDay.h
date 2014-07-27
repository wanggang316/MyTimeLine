//
//  WGStoryDay.h
//  ObjcTimeLine
//
//  Created by 王刚 on 14/7/27.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WGStoryPoint.h"

@interface WGStoryDay : NSObject

@property (nonatomic, readonly, strong) NSDate *date;

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;
@property (nonatomic, readonly, strong) NSArray *storyPoints;

- (id)initWithDate:(NSDate *)aDate;

- (void)addStoryPoint:(WGStoryPoint *)point;

- (NSArray *)storyPoints;

@end
