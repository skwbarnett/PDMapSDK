//
//  BntAttendanceManager.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/17.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BntLoc_AttenResponse.h"

@protocol BntAttendanceDelegate <NSObject>

@end

typedef void(^AttendanceLocationComplete)(BntLoc_AttenResponse *response);

@interface BntAttendanceManager : NSObject

//  定位失败次数
@property (nonatomic, assign) NSInteger locationErrorTime;

@property (nonatomic, assign) NSInteger autoLocationErrorTime;

@property (nonatomic, weak) id<BntAttendanceDelegate> delegate;
//  定位缓存
@property (nonatomic, strong) BntLoc_AttenResponse *locationCache;

//  GPS是否开启
+ (BOOL)locationAuthorizationStatus;

+ (id)defaultManager;

- (void)locationUnderCommand:(BntAttendanceCommand *)command success:(AttendanceLocationComplete)success failure:(AttendanceLocationComplete)failure;

@end
