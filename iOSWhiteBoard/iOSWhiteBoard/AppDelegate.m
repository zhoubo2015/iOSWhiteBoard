//
//  AppDelegate.m
//  iOSWhiteBoard
//
//  Created by ZhouDamon on 2017/3/24.
//  Copyright © 2017年 Damon. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *versionOC = @"10.3.2";
    NSString *resultVersion = @"";
    NSArray *arrry = [versionOC componentsSeparatedByString:@"."];
    if (1 == arrry.count) {
        resultVersion = [arrry objectAtIndex:0];
    }
    else {
        for (NSInteger i = 0; i < 2; i++) {
            resultVersion = [resultVersion stringByAppendingString:(0 == i)?[arrry objectAtIndex:i]:[NSString stringWithFormat:@".%@", [arrry objectAtIndex:i]]];
        }
    }
    float f = resultVersion.floatValue;
    double d = resultVersion.doubleValue;
    CGFloat ff1 = 123.5f;
    CGFloat ff2 = 123.2f;
    CGFloat ff3 = 123.8f;
    NSInteger ii1 = ff1;
    NSInteger ii2 = ff2;
    NSInteger ii3 = ff3;
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
