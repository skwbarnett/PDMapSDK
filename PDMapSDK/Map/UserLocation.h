//
//  UserLocation.h
//  PDMapSDK
//
//  Created by Barnett Wu on 2016/11/15.
//  Copyright © 2016年 Barnett Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BntMapIMP.h"
#import "BntLoc_AttenResponse.h"
#import "BntAtten_LocRequest.h"

typedef void(^BntLocatingComplete)(BntLoc_AttenResponse *result);

@interface UserLocation : NSObject

@property (nonatomic, strong) BntLocationConfigure *locationConfigure;

- (void)requestLoactionWithRequest:(BntAtten_LocRequest *)request success:(BntLocatingComplete)successBlock failure:(BntLocatingComplete)failureBlock;

@end
