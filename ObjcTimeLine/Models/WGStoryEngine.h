//
//  WGStoryEngine.h
//  ObjcTimeLine
//
//  Created by 王刚 on 14/7/26.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WGStoryPoint.h"
#import "WGStoryDay.h"

typedef void (^WGSaveBlock)(BOOL succeeded, NSError *error);
typedef void (^WGResultBlock)(NSArray *objects, NSError *error);

@interface WGStoryEngine : NSObject

- (void)saveAPoint:(WGStoryPoint *)point completion:(WGSaveBlock)completionHandler;


- (void)allTimePoints:(WGResultBlock)completionHandler;

@end
