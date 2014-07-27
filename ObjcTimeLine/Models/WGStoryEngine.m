//
//  WGStoryEngine.m
//  ObjcTimeLine
//
//  Created by 王刚 on 14/7/26.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "WGStoryEngine.h"
#import <AVOSCloud/AVOSCloud.h>

@implementation WGStoryEngine

- (void)saveAPoint:(WGStoryPoint *)point completion:(WGSaveBlock)completionHandler {
    
    AVObject *timePoint = [AVObject objectWithClassName:@"TimePoint"];
    timePoint[@"text"] = point.text;
    [timePoint saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        completionHandler(succeeded, error);
    }];
    
}


- (void)allTimePoints:(WGResultBlock)completionHandler {
    AVQuery *query = [AVQuery queryWithClassName:@"TimePoint"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        NSMutableArray *result = [NSMutableArray new];
        for (AVObject *obj in objects) {
            NSDate *date = obj.createdAt;
            
            WGStoryDay *storyDay = [self dayFromDays:result date:date];
            
            [storyDay addStoryPoint:[[WGStoryPoint alloc]initWithDate:date text:[obj objectForKey:@"text"]]];
            
        }
        completionHandler(result, error);
       
        
    }];
    
    
}


- (WGStoryDay *)dayFromDays:(NSMutableArray *)days date:(NSDate *)date {
    WGStoryDay *result;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    
    for (WGStoryDay *day in days) {
        if ([[dateFormatter stringFromDate:day.date] isEqualToString:strDate]) {
            result = day;
            break;
        }
    }
    
    if (!result) {
        result = [[WGStoryDay alloc]initWithDate:date];
        [days addObject:result];
    }
    
    return result;
}

@end
