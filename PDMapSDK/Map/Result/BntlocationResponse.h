//
//  BntlocationResponse.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/17.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BntLocationReGeocode.h"
#import "BntMapIMP.h"

@interface BntlocationResponse : NSObject

@property (nonatomic, strong) CLLocation *location;

@property (nonatomic, strong) BntLocationReGeocode *regeocode;

@property (nonatomic, strong) NSError *error;

@end
