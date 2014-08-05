//
//  WGLoginViewController.h
//  ObjcTimeLine
//
//  Created by 王刚 on 14/7/28.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TencentOpenAPI/TencentOAuth.h>


@interface WGLoginViewController : UIViewController <TencentSessionDelegate, UIImagePickerControllerDelegate>

{
    TencentOAuth* _tencentOAuth;
    NSMutableArray* _permissions;
}

@end
