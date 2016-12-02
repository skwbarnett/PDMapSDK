//
//  PDApiAtten_ConfirmRequest.m
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/18.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import "PDApiAtten_ConfirmRequest.h"
#import "PDDataExtension.h"

#define MAPI_Punch  @"pd.attendance.apply"

@implementation PDApiAtten_ConfirmRequest

- (void)punchRequestExchange{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSArray *proNameMArr = [PDDataExtension getProperties:[PDApiAtten_ConfirmRequest class]];
    for (NSString *proName in proNameMArr) {
        id value = [self valueForKey:proName];
        if (value) {
            [param setValue:value forKey:proName];
        }
    }
//    param = @{@"id":self.attendanceId ? self.attendanceId :@"",
//              @"type":self.type ? self.type :@"",
//              @"longitude":self.longitude ? self.longitude :@"",
//              @"latitude":self.latitude ? self.latitude :@"",
//              @"date":self.date ? self.date :@"",
//              @"range":self.range ? self.range :@"",
//              @"address":self.reGoecode ? self.reGoecode :@"",
//              @"device_mac":self.device_mac ? self.device_mac :@""
//              }.mutableCopy;
}

@end
