//
//  PDApiAtten_Request.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/18.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PDApiAtten_Request : NSObject

+ (instancetype)request:(id)requstObj;

@property (nonatomic, strong) NSDictionary *param;

@property (nonatomic, strong) NSString *mapi;

@end
