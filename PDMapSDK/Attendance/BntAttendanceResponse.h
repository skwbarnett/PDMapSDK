//
//  BntAttendanceResponse.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/17.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BntLoc_AttenResponse.h"

typedef NS_ENUM(NSUInteger, BntAttendanceResponseType) {
    BntAttendanceResponseTypeConnectting = 901,
    BntAttendanceResponseTypeSuccess,
    BntAttendanceResponseTypeFailure,
};

@interface BntAttendanceResponse : NSObject

@property (nonatomic, assign) BntAttendanceResponseType type;

@property (nonatomic, strong) BntLoc_AttenResponse *locResponse;

@end
