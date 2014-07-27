//
//  WGStoryDay.m
//  ObjcTimeLine
//
//  Created by 王刚 on 14/7/27.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "WGStoryDay.h"

@interface WGStoryDay()
{
    NSMutableArray *_innerStoryPoints;
}

@property (nonatomic, readwrite, strong) NSDate *date;


@property (nonatomic, readwrite, copy) NSString *title;
@property (nonatomic, readwrite, copy) NSString *subtitle;

@end

@implementation WGStoryDay

- (id)initWithDate:(NSDate *)aDate{
    
    if (self = [super init]) {
        
        NSCalendar *cal = [NSCalendar currentCalendar];
        unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit;
        NSDateComponents *dd = [cal components:unitFlags fromDate:aDate];
        NSInteger year = [dd year];
        NSInteger month = [dd month];
        NSInteger day = [dd day];
        NSInteger hour = [dd hour];
        NSInteger min = [dd minute];
        NSInteger sec = [dd second];
        NSInteger weekDay = [dd weekday];
        
        
        self.date = aDate;
        self.title = [self weekString:weekDay];
        self.subtitle = [NSString stringWithFormat:@"%d月%d日",month,day];
        _innerStoryPoints = [NSMutableArray new];
    }
    return self;
}

- (void)addStoryPoint:(WGStoryPoint *)point {
    [_innerStoryPoints addObject:point];
}

- (NSArray *)storyPoints {
    return [_innerStoryPoints copy];
}

- (NSString *)weekString:(NSInteger)weekday {
    NSString *result;
    switch (weekday) {
        case 1: {
            result =  @"星期日";
            break;
        }
        case 2: {
            result = @"星期一";
            break;
        }
        case 3: {
            result = @"星期二";
            break;
        }
        case 4: {
            result = @"星期三";
            break;
        }
        case 5: {
            result = @"星期四";
            break;
        }
        case 6: {
            result = @"星期五";
            break;
        }
        case 7: {
            result = @"星期六";
            break;
        }
        default:
            result = @"错误";
            break;
    }
    return result;
}

@end
