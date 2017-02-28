//
//  AppDelegate.m
//  JSPatchDemo
//
//  Created by Jack_zz on 2017/2/28.
//  Copyright © 2017年 jack_zz. All rights reserved.
//

#import "AppDelegate.h"
#import <JSPatchPlatform/JSPatch.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //使用本地jspatch文件
    [JPEngine startEngine];
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"js"];
    NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    [JPEngine evaluateScript:script];
    
    //    使用本地jspatch文件
    //    [JPEngine startEngine];
    //    NSString *sourcePath1 = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"js"];
    //    NSString *script1 = [NSString stringWithContentsOfFile:sourcePath1 encoding:NSUTF8StringEncoding error:nil];
    //    /*
    //     用于发布前测试脚本。先把脚本放入项目中，调用后，会在当前项目的 bundle 里寻找 main.js 文件执行
    //     测试完成后请删除，改为调用 +startWithAppKey: 和 +sync
    //     我使用的时候好像有点问题
    //     */
    //    [JPEngine evaluateScript:script1];
    //    [JSPatch testScriptInBundle];
    
    
    /*-------------------------👇真实开发代码-------------------------------*/
#ifdef DEBUG
    /*
     进入开发模式
     平台下发补丁时选择开发预览模式，会只对调用了这个方法的客户端生效。
     在 `+sync:` 之前调用，建议在 #ifdef DEBUG 里调。
     */
    [JSPatch setupDevelopment];
    
    /*
     自定义log，使用方法：
     [JSPatch setLogger:^(NSString *msg) {
     //msg 是 JSPatch log 字符串，用你自定义的logger打出
     }];
     在 `+startWithAppKey:` 之前调用
     */
    [JSPatch setupLogger:^(NSString *msg) {
        NSLog(@"JSPatch_log:%@",msg);
    }];
    
    /*
     事件回调
     type: 事件类型，详见 JPCallbackType 定义
     data: 回调数据
     error: 事件错误
     在 `+startWithAppKey:` 之前调用
     */
    [JSPatch setupCallback:^(JPCallbackType type, NSDictionary *data, NSError *error) {
        switch (type) {
            case JPCallbackTypeUpdate: {
                NSLog(@"jspatch_updated %@ %@", data, error);
                break;
            }
            case JPCallbackTypeRunScript: {
                NSLog(@"jspatch_run script %@ %@", data, error);
                break;
            }
            default:
                break;
        }
    }];
    
    [JSPatch sync];
#endif
    [JSPatch sync];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
