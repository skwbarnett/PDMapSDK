//
//  PDApiAttendanceCommand.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/18.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ApiAttendanceCommand) {
    ApiAttendanceCommandConfirm = 1001,
    ApiAttendanceCommandList,
    ApiAttendanceCommandStatus,
};

@interface PDApiAttendanceCommand : NSObject

@property (nonatomic, assign) ApiAttendanceCommand command;

@end
