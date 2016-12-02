//
//  PDApiAtten_ConfirmRequest.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/18.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PDApiAtten_ConfirmRequest : NSObject

@property (nonatomic, strong) NSString *attendanceId;
//  精度
@property (nonatomic, assign) CGFloat longitude;
//  维度
@property (nonatomic, assign) CGFloat latitude;
//  打卡有效范围
@property (nonatomic, strong) NSString *range;
//  打卡设备mac地址
@property (nonatomic, strong) NSString *device_mac;
//  gps/wifi/traffic
@property (nonatomic, strong) NSString *type;
//  打卡时间:yyyy-MM-dd HH:mm
@property (nonatomic, strong) NSString *date;
//  逆地理信息
@property (nonatomic, strong) NSString *reGoecode;

- (void)punchRequestExchange;

@end
