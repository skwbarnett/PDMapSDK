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
        [defaultManger configureData];
    });
    
    return defaultManger;
}

- (void)configureData{
    self.requestId = 6000;
}

- (void)locationUnderCommand:(BntAttendanceCommand *)command success:(AttendanceLocationComplete)success failure:(AttendanceLocationComplete)failure{

    if (command.commandType == AttendanceCommandTypeLocation) {
        BntAtten_LocRequest *requst = [self configureAtten_LocationRequest:command];
        BntLocationConfigure *locConfigure = [BntLocationConfigure initlocationConfigure];
        locConfigure.allowsBackgroundLocationUpdates = YES;
        locConfigure.locationTimeout = 10;
        locConfigure.reGeocodeTimeout = 15;
        
        [self.userLocation requestLoactionWithRequest:requst success:^(BntLoc_AttenResponse *result) {
            success(result);
        } failure:^(BntLoc_AttenResponse *result) {
            failure(result);
        }];
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
