//
//  WGAppDelegate.m
//  ObjcTimeLine
//
//  Created by 王刚 on 14/7/25.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "WGAppDelegate.h"
#import "WGRootViewController.h"
#import "WGLoginViewController.h"
#import "iflyMSC/iflySetting.h"
#import <AVOSCloud/AVOSCloud.h>
#import <TencentOpenAPI/TencentOAuth.h>


@implementation WGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    [AVOSCloud setApplicationId:@"xgeduaupbz9dp61n0oly7b1khcugr0tx5oj1193wd9zlrpao"
                      clientKey:@"phlxvsq4mnares39lqbz6ebas6fub81vgb90wlk7i5y0skde"];
    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
   
    
    [IFlySetting setLogFile:LVL_ALL];
    [IFlySetting showLogcat:YES];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [paths objectAtIndex:0];
    [IFlySetting setLogFilePath:cachePath];

    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:[[WGRootViewController alloc]init]];
    
    self.window.rootViewController = navigationController;
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [TencentOAuth HandleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [TencentOAuth HandleOpenURL:url];
}


@end
