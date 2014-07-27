//
//  WGStoryPoint.h
//  ObjcTimeLine
//
//  Created by 王刚 on 14/7/26.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WGStoryPoint : NSObject

@property (nonatomic, strong, readonly) NSDate *date;

@property (nonatomic, copy, readonly) NSString *time;
@property (nonatomic, copy, readonly) NSString *text;

- (id)initWithDate:(NSDate *)aDate
              text:(NSString *)aText;

- (id)initWithText:(NSString *)aText;

@end
