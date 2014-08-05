//
//  WGStoryPoint.m
//  ObjcTimeLine
//
//  Created by 王刚 on 14/7/26.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "WGStoryPoint.h"


@interface WGStoryPoint()

@property (nonatomic, strong, readwrite) NSDate *date;

@property (nonatomic, copy, readwrite) NSString *time;
@property (nonatomic, copy, readwrite) NSString *text;

@end

@implementation WGStoryPoint


- (id)initWithDate:(NSDate *)aDate text:(NSString *)aText {
    if (self = [super init]) {
        
        NSCalendar *cal = [NSCalendar currentCalendar];
        unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekCalendarUnit;
        NSDateComponents *dd = [cal components:unitFlags fromDate:aDate];
        NSInteger hour = [dd hour];
        NSInteger min = [dd minute];
        
        self.date = aDate;
        self.time = [NSString stringWithFormat:@"%d:%d",hour,min];
        self.text = [aText copy];
    }
    return self;
}


- (id)initWithText:(NSString *)aText {
    return [self initWithDate:nil text:aText];
}



@end
