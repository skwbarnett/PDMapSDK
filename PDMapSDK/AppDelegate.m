//
//  AppDelegate.m
//  PDMapSDK
//
//  Created by Barnett Wu on 2016/11/15.
//  Copyright © 2016年 Barnett Wu. All rights reserved.
//

#import "AppDelegate.h"
//#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import <MAMapKit/MAMapKit.h>
#import "ViewController.h"
#import "MapLocationController.h"
#define AMapKey @"abd8982732469a294eb11e6fc9b828fa"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)configureAPIKey
{    
    [AMapServices sharedServices].apiKey = AMapKey;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configureAPIKey];
    MapLocationController *vc = [[MapLocationController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
