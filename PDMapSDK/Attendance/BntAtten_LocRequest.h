//
//  BntAtten_LocRequest.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/17.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BntHardwareInfo.h"

@interface BntAtten_LocRequest : NSObject

@property (nonatomic, strong) BntHardwareInfo *hardwareInfo;

@property (nonatomic, strong) NSString *requstId;

@property (nonatomic, strong) NSString *date;

@end
