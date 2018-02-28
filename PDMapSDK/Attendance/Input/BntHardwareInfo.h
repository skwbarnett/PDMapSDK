//
//  BntHardwareInfo.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/17.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BntHardwareInfo : NSObject

@property (nonatomic, strong) NSString *device_UUID;

@property (nonatomic, strong) NSString *WiFi_SSID;

@property (nonatomic, strong) NSString *device_MacAddress;

@end
