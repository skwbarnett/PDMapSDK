//
//  BntHardwareManager.m
//  PDMapSDK
//
//  Created by Barnett Wu on 2016/11/16.
//  Copyright © 2016年 Barnett Wu. All rights reserved.
//

#import "BntHardwareManager.h"
#import "KeyChainStore.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#define  KEY_USERNAME_PASSWORD @"tangyv.com.PuDongBP.usernamepassword"
#define  KEY_USERNAME @"tangyv.com.PuDongBP.username"
#define  KEY_PASSWORD @"tangyv.com.PuDongBP.password"

@implementation BntHardwareManager

+ (BntHardwareInfo *)hardwareInfoAnalyse{
    BntHardwareManager *manager = [[BntHardwareManager alloc] init];
    manager.hardwareInfo = [[BntHardwareInfo alloc] init];
    manager.hardwareInfo.WiFi_SSID = [BntHardwareManager getDeviceWiFiSSID];
    manager.hardwareInfo.device_UUID = [BntHardwareManager getUUID];
    return manager.hardwareInfo;
}

+ (NSString *) getDeviceWiFiSSID
{
    NSArray *ifs = (__bridge id)CNCopySupportedInterfaces();
    
    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) {
            break;
        }
    }
    NSDictionary *dctySSID = (NSDictionary *)info;
    NSString *ssid = [[dctySSID objectForKey:@"SSID"] lowercaseString];
    
    return ssid;   
}

+ (NSString *) getMacAddress
{
    
    int         mib[6];
    size_t       len;
    char        *buf;
    unsigned char    *ptr;
    struct if_msghdr  *ifm;
    struct sockaddr_dl *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    
    //  NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    
    NSLog(@"outString:%@", outstring);
    
    free(buf); 
    
    return [outstring uppercaseString]; 
}


+(NSString *)getUUID
{
    NSString * strUUID = (NSString *)[KeyChainStore load:KEY_USERNAME_PASSWORD];
    
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID)
    {
        //生成一个uuid的方法
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        
        //将该uuid保存到keychain
        [KeyChainStore save:KEY_USERNAME_PASSWORD data:strUUID];
        
    }
    return strUUID;
}

@end
