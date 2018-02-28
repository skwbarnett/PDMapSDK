//
//  BntAttendanceStatusAnalyse.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/12/8.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BntAttendanceManager.h"

@interface BntAttendanceStatusAnalyse : NSObject

+ (instancetype)statusAnalyseInit;

- (void)attendanceStatusSuccess:(AttendanceLocationComplete)success
                        failure:(AttendanceLocationComplete)failure;

- (void)startAutomaticLBSMode;

- (void)stopAutomaticLBSMode;

@end
