//
//  BntAttendanceManager.m
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/17.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import "BntAttendanceManager.h"
#import "UserLocation.h"
#import "BntHardwareManager.h"

@interface BntAttendanceManager ()

@property (nonatomic, strong) UserLocation *userLocation;

@property (nonatomic, assign) NSInteger requestId;

@end

@implementation BntAttendanceManager

+ (id)defaultManager {
    static BntAttendanceManager *defaultManger = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        defaultManger = [[self alloc] init];
        defaultManger.locationErrorTime = 0;
        defaultManger.autoLocationErrorTime = 0;
        [defaultManger configureData];
    });
    
    return defaultManger;
}

+ (BOOL)locationAuthorizationStatus{
    if ([CLLocationManager locationServicesEnabled] &&
        !([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)) {
        return YES;
    }else return NO;
}

- (void)configureData{
    self.requestId = 6000;
}

- (void)locationUnderCommand:(BntAttendanceCommand *)command success:(AttendanceLocationComplete)success failure:(AttendanceLocationComplete)failure{
    __weak typeof (self)weakSelf = self;
    if (command.commandType == AttendanceCommandTypeLocation) {
        BntAtten_LocRequest *requst = [self configureAtten_LocationRequest:command];
        BntLocationConfigure *locConfigure = [BntLocationConfigure initlocationConfigure];
        locConfigure.allowsBackgroundLocationUpdates = YES;
        locConfigure.locationTimeout = 2;
        locConfigure.reGeocodeTimeout = 2;
        self.userLocation.locationConfigure = locConfigure;
        [self.userLocation requestLoactionWithRequest:requst success:^(BntLoc_AttenResponse *result) {
            [weakSelf RSSIAnalyse:result];
            success(result);
        } failure:^(BntLoc_AttenResponse *result) {
            failure(result);
        }];
    }
}

- (void)RSSIAnalyse:(BntLoc_AttenResponse *)result{
    CLLocation *loction = result.locResponse.location;
    if (loction.horizontalAccuracy > 200) {
        result.isNonGPSRSSI = YES;
    }else{
        result.isNonGPSRSSI = NO;
    }
}

- (BntAtten_LocRequest *)configureAtten_LocationRequest:(BntAttendanceCommand *)command{
    BntAtten_LocRequest *request = [[BntAtten_LocRequest alloc] init];
    
    request.hardwareInfo = [BntHardwareManager hardwareInfoAnalyse];
    self.requestId ++;
    request.requstId = [NSString stringWithFormat:@"%@%@",command.commandId,@(self.requestId)];
    request.date = [self nowDateString];
    
    return request;
}

- (NSString *)nowDateString{
    NSDate *date = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy年MM月dd号 HH:mm:ss";
    NSString *dateString = [format stringFromDate:date];
    return dateString;
}

- (UserLocation *)userLocation{
    if (_userLocation == nil) {
        _userLocation = [[UserLocation alloc] init];
    }
    return _userLocation;
}

@end
