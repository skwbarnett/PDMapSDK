//
//  BntMapHTTPManager.m
//  PDMapSDK
//
//  Created by Barnett Wu on 2016/11/16.
//  Copyright © 2016年 Barnett Wu. All rights reserved.
//

#import "BntMapHTTPManager.h"
#import "PDApiAtten_Request.h"
#import "PDMapApiKit.h"

@implementation BntMapHTTPManager

//  打卡
+ (void)Atten_Comfirm:(id)request success:(CompleteBlock)success{
//    PDApiAtten_Request *requestObj = [PDApiAtten_Request request:request];
    success(@(YES));
}

//  打卡任务列表
+ (void)Atten_List:(id)request success:(CompleteBlock)success{
    
}

//  打卡状态
+ (void)Atten_Status:(id)request success:(CompleteBlock)success{
    
}

@end
