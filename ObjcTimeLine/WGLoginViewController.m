//
//  WGLoginViewController.m
//  ObjcTimeLine
//
//  Created by 王刚 on 14/7/28.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "WGLoginViewController.h"

@interface WGLoginViewController ()

@end

@implementation WGLoginViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    _permissions = [NSMutableArray arrayWithObjects:
                     kOPEN_PERMISSION_GET_USER_INFO,
                     kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                     kOPEN_PERMISSION_ADD_ALBUM,
                     kOPEN_PERMISSION_ADD_IDOL,
                     kOPEN_PERMISSION_ADD_ONE_BLOG,
                     kOPEN_PERMISSION_ADD_PIC_T,
                     kOPEN_PERMISSION_ADD_SHARE,
                     kOPEN_PERMISSION_ADD_TOPIC,
                     kOPEN_PERMISSION_CHECK_PAGE_FANS,
                     kOPEN_PERMISSION_DEL_IDOL,
                     kOPEN_PERMISSION_DEL_T,
                     kOPEN_PERMISSION_GET_FANSLIST,
                     kOPEN_PERMISSION_GET_IDOLLIST,
                     kOPEN_PERMISSION_GET_INFO,
                     kOPEN_PERMISSION_GET_OTHER_INFO,
                     kOPEN_PERMISSION_GET_REPOST_LIST,
                     kOPEN_PERMISSION_LIST_ALBUM,
                     kOPEN_PERMISSION_UPLOAD_PIC,
                     kOPEN_PERMISSION_GET_VIP_INFO,
                     kOPEN_PERMISSION_GET_VIP_RICH_INFO,
                     kOPEN_PERMISSION_GET_INTIMATE_FRIENDS_WEIBO,
                     kOPEN_PERMISSION_MATCH_NICK_TIPS_WEIBO,
                     nil];
    
    
    NSString *appid = @"222222";
    
    _tencentOAuth = [[TencentOAuth alloc] initWithAppId:appid
                                            andDelegate:self];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(id)sender {
    
    [_tencentOAuth authorize:_permissions inSafari:NO];
    
}

- (IBAction)onClickLogout:(id)sender
{
    NSLog(@"退出登录");
    [_tencentOAuth logout:self];
}



/**
 * Called when the user successfully logged in.
 */
- (void)tencentDidLogin {
    // 登录成功

    if (_tencentOAuth.accessToken
        && 0 != [_tencentOAuth.accessToken length])
    {
        NSLog(@"%@", _tencentOAuth.accessToken);
    }
    else
    {
        NSLog(@"登录不成功 没有获取accesstoken");
    }

}
/**
 * 登录失败后的回调
 * \param cancelled 代表用户是否主动退出登录
 */
- (void)tencentDidNotLogin:(BOOL)cancelled
{
    if (cancelled){
       NSLog(@"用户取消登录");
    }
    else {
        NSLog(@"登录失败");
    }
    
}

/**
 * Called when the notNewWork.
 */
-(void)tencentDidNotNetWork
{
     NSLog(@"无网络连接，请设置网络");
}

/**
 * Called when the logout.
 */
-(void)tencentDidLogout
{
    NSLog(@"退出登录成功，请重新登录");

}

@end
