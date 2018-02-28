//
//  BntMapHTTPManager.h
//  PDMapSDK
//
//  Created by Barnett Wu on 2016/11/16.
//  Copyright © 2016年 Barnett Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PDApiAtten_Request.h"

@class PDApiAtten_Request;

typedef void(^CompleteBlock)(id model);

@interface BntMapHTTPManager : NSObject

//  打卡
+ (void)Atten_Comfirm:(id)request success:(CompleteBlock)success;

//  打卡任务列表
+ (void)Atten_List:(id)request success:(CompleteBlock)success;

//  打卡状态
+ (void)Atten_Status:(id)request success:(CompleteBlock)success;

@end
