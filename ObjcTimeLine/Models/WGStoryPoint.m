//
//  WGStoryPoint.m
//  ObjcTimeLine
//
//  Created by 王刚 on 14/7/26.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "WGStoryPoint.h"


@interface WGStoryPoint()

@property (nonatomic, strong, readwrite) NSDate *time;
@property (nonatomic, copy, readwrite) NSString *text;

@end

@implementation WGStoryPoint


- (id)initWithTime:(NSDate *)aTime text:(NSString *)aText {
    if (self = [super init]) {
        self.time = aTime;
        self.text = [aText copy];
    }
    return self;
}




@end
