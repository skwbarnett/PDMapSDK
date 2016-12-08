//
//  BntAttendanceStatusAnalyse.m
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/12/8.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import "BntAttendanceStatusAnalyse.h"
#import "NSDate+Bnt.h"
#import "AppHeader.h"

@interface BntAttendanceStatusAnalyse ()

@property (nonatomic, strong)BntAttendanceManager *LBSManager;

@property (nonatomic, copy)AttendanceLocationComplete success;

@property (nonatomic, copy)AttendanceLocationComplete failure;

@property (nonatomic, copy)AttendanceLocationComplete autoSuccess;

@property (nonatomic, copy)AttendanceLocationComplete autoFailure;

@property (nonatomic, strong) NSTimer *autoTimer;

@end

@implementation BntAttendanceStatusAnalyse

+ (instancetype)statusAnalyseInit{
    BntAttendanceStatusAnalyse *statusAnalyse = [[BntAttendanceStatusAnalyse alloc] init];
    BntAttendanceManager *manager = [BntAttendanceManager defaultManager];
    statusAnalyse.LBSManager = manager;
    return statusAnalyse;
}

- (void)startAutomaticLBSMode{
    self.autoTimer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(automaticLBS) userInfo:nil repeats:YES];
    [self.autoTimer fire];
}

- (void)stopAutomaticLBSMode{
    [self.autoTimer invalidate];
    self.autoTimer = nil;
}

- (void)automaticLBS{
    __weak typeof (self)weakSelf = self;
    NSLog(@"%@",[NSDate date]);
    BntAttendanceCommand *command = [BntAttendanceCommand command];
    command.commandId = @(1001).stringValue;
    command.commandType = AttendanceCommandTypeLocation;
    [self.LBSManager locationUnderCommand:command success:^(BntLoc_AttenResponse *response) {
        [weakSelf automaticModeSuccessOperation:response];
    } failure:^(BntLoc_AttenResponse *response) {
        [weakSelf automaticModeErrorOperation:response];
    }];
}

- (void)attendanceStatusSuccess:(AttendanceLocationComplete)success failure:(AttendanceLocationComplete)failure{
    
    __weak typeof (self)weakSelf = self;
    self.success = success;
    self.failure = failure;
    BntAttendanceCommand *command = [BntAttendanceCommand command];
    command.commandId = @(1001).stringValue;
    command.commandType = AttendanceCommandTypeLocation;
    [self.LBSManager locationUnderCommand:command success:^(BntLoc_AttenResponse *response) {
        [weakSelf loactionSuccessOperation:response];
    } failure:^(BntLoc_AttenResponse *response) {
        [weakSelf locationErrorOperation:response];
    }];
}

- (void)automaticModeSuccessOperation:(BntLoc_AttenResponse *)response{
    self.LBSManager.locationCache = response;
    self.LBSManager.autoLocationErrorTime = 0;
}

- (void)automaticModeErrorOperation:(BntLoc_AttenResponse *)response{
    self.LBSManager.autoLocationErrorTime ++;
    if (_LBSManager.autoLocationErrorTime == 50) {
        _LBSManager.autoLocationErrorTime = 0;
        
    }else if (_LBSManager.autoLocationErrorTime < 50){
        if (_LBSManager.locationCache) {
            BntLoc_AttenResponse *cache = _LBSManager.locationCache;
            NSTimeInterval interval = [NSDate intervalNowBetweenString:cache.responseTimestamp];
            if (interval > 60) {
                [self automaticLBS];
            }
        }else{
            [self automaticLBS];
        }
    }
}

- (void)loactionSuccessOperation:(BntLoc_AttenResponse *)response{
    self.LBSManager.locationErrorTime = 0;
    self.LBSManager.locationCache = response;
    self.success(response);
}

- (void)locationErrorOperation:(BntLoc_AttenResponse *)response{
    self.LBSManager.locationErrorTime ++;
    if (_LBSManager.locationErrorTime == 3) {
        _LBSManager.locationErrorTime = 0;
        if (_LBSManager.locationCache) {//  五分钟内缓存
            BntLoc_AttenResponse *cache = _LBSManager.locationCache;
            NSTimeInterval interval = [NSDate intervalNowBetweenString:cache.responseTimestamp];
            if (interval < 300) {
                if (_success) {
                    _success(cache);
                }
            }else if(_failure){
                _failure(response);
            }
        }else{
            if (_failure) {
                _failure(response);
            }
        }
    }else if(_LBSManager.locationErrorTime < 3){
        [self attendanceStatusSuccess:_success failure:_failure];
    }
}

@end
