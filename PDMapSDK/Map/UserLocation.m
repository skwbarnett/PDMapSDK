//
//  UserLocation.m
//  PDMapSDK
//
//  Created by Barnett Wu on 2016/11/15.
//  Copyright © 2016年 Barnett Wu. All rights reserved.
//

#import "UserLocation.h"
#import "BntLocDataAnalyse.h"

@interface UserLocation ()<AMapLocationManagerDelegate>

@property (nonatomic, strong) AMapLocationManager *AMaplocManager;

@property (nonatomic, copy) BntLocatingComplete successBlock;

@property (nonatomic, copy) BntLocatingComplete failureBlock;

@property (nonatomic, strong) BntLocationReGeocode *gencode;

@end

@implementation UserLocation

- (void)requestLoactionWithRequest:(BntAtten_LocRequest *)request success:(BntLocatingComplete)successBlock failure:(BntLocatingComplete)failureBlock{
    _successBlock = successBlock;
    _failureBlock = failureBlock;
    [BntLocDataAnalyse AMaplocationConfigure:_locationConfigure AMapManager:self.AMaplocManager];
    [self.AMaplocManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        BntLoc_AttenResponse *result = [BntLocDataAnalyse loc_AttendanceResponse_locationRequest:request location:location regoecode:regeocode error:error];
        if (error) {
            result.success = NO;
            failureBlock(result);
        }else{
            result.success = YES;
            successBlock(result);
        }
    }];
}

#pragma mark locaiton delegate

- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error{
    BntLoc_AttenResponse *result = [[BntLoc_AttenResponse alloc] init];
    result.locResponse.error = error;
    _failureBlock(result);
}

#pragma mark setter && getter

- (AMapLocationManager *)AMaplocManager{
    if (_AMaplocManager == nil) {
        _AMaplocManager = [[AMapLocationManager alloc] init];
        _AMaplocManager.delegate = self;
    }
    return _AMaplocManager;
}

@end
