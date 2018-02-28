//
//  PDApiAtten_Model.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/18.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, AttendanceStatusType) {
    AttendanceStatusTypeNormal = 0,
    AttendanceStatusTypeBeyond,
    AttendanceStatusTypeNonarrival,
};

@interface PDApiAtten_Model : NSObject

@property (nonatomic, strong) NSString *attendanceId;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *date;

@property (nonatomic, assign) AttendanceStatusType status;

@property (nonatomic, strong) NSString *attenDescription;


@end
