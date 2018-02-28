//
//  BntAttendanceCommand.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/17.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, AttendanceCommandType) {
    AttendanceCommandTypeNull = 1001,
    AttendanceCommandTypeLocation,
};

@interface BntAttendanceCommand : NSObject

@property (nonatomic, assign) AttendanceCommandType commandType;

@property (nonatomic, strong) NSString *commandId;

+ (BntAttendanceCommand *)command;

@end
