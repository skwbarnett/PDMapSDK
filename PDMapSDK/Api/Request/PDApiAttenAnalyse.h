//
//  PDApiAttenAnalyse.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/21.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PDApiAtten_ConfirmRequest.h"
#import "BntLoc_AttenResponse.h"

@interface PDApiAttenAnalyse : NSObject

+ (PDApiAtten_ConfirmRequest *)configureAttenConfirmRequest:(BntLoc_AttenResponse *)response;

@end
