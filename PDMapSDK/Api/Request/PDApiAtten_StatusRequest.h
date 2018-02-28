//
//  PDApiAtten_StatusRequest.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/18.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PDApiAtten_StatusRequest : NSObject

@property (nonatomic, strong) NSString *taskId;

@property (nonatomic, strong) NSString *date;

@property (nonatomic, strong) NSString *longitude;

@property (nonatomic, strong) NSString *latitude;


@end
