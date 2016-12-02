//
//  PDApiAtten_Request.m
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/18.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import "PDApiAtten_Request.h"
#import <objc/runtime.h>
#include <objc/NSObject.h>
#import <UIKit/UIKit.h>

#import "PDDataExtension.h"

#define Attendance_RequestClass_Confirm     @"PDApiAtten_ConfirmRequest"
#define Attendance_RequestClass_Status      @"PDApiAtten_StatusRequest"

#define Attendance_MAPI_Confirm             @"pd.attendance.apply"
#define Attendance_MAPI_Status              @"pd.attendance.apply"

@implementation PDApiAtten_Request

+ (instancetype)request:(id)requstObj{
    PDApiAtten_Request *request = [[PDApiAtten_Request alloc] init];
    [request attenRequestConfigure:requstObj];
    [request attenRequestMApi:[requstObj class]];
    return request;
}

- (void)attenRequestConfigure:(id)request{
    self.param = [PDDataExtension propertyExchangeKeyValue:request];
}

- (void)attenRequestMApi:(Class)requestClass{
    NSString *className = NSStringFromClass(requestClass);
    if ([className isEqualToString:Attendance_RequestClass_Confirm]) {
        self.mapi = Attendance_MAPI_Confirm;
    }else if ([className isEqualToString:Attendance_RequestClass_Status]){
        self.mapi = Attendance_MAPI_Status;
    }
}

@end
