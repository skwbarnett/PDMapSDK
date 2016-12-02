//
//  BntLoc_AttenResponse.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/17.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BntAttendanceCommand.h"
#import "BntlocationResponse.h"
#import "BntHardwareInfo.h"
@class BntlocationResponse;

@interface BntLoc_AttenResponse : NSObject

@property (nonatomic, strong) NSString *responseId;

@property (nonatomic, assign) BOOL success;

@property (nonatomic, strong) BntlocationResponse *locResponse;
//@property (nonatomic, strong) BntlocationResponse *respon;

@property (nonatomic, strong) BntHardwareInfo *hardwareInfo;

@property (nonatomic, strong) NSString *requestTimestamp;

@property (nonatomic, strong) NSString *responseTimestamp;

@end
