//
//  PDApiAttenAnalyse.m
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/21.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import "PDApiAttenAnalyse.h"
#import "PDApiAtten_ConfirmRequest.h"
#import "BntLoc_AttenResponse.h"

@implementation PDApiAttenAnalyse

+ (PDApiAtten_ConfirmRequest *)configureAttenConfirmRequest:(BntLoc_AttenResponse *)response{
    PDApiAtten_ConfirmRequest *request = [[PDApiAtten_ConfirmRequest alloc] init];
    request.longitude = response.locResponse.location.coordinate.longitude;
    request.latitude = response.locResponse.location.coordinate.latitude;
    request.device_mac = response.hardwareInfo.device_UUID;
    request.date = response.responseTimestamp;
    request.reGoecode = response.locResponse.regeocode.formattedAddress;
    
    return request;
}

@end
