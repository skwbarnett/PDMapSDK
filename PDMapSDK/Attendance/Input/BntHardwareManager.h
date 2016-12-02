//
//  BntHardwareManager.h
//  PDMapSDK
//
//  Created by Barnett Wu on 2016/11/16.
//  Copyright © 2016年 Barnett Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BntHardwareInfo.h"
#import "BntMapIMP.h"

@interface BntHardwareManager : NSObject

@property (nonatomic, strong) BntHardwareInfo *hardwareInfo;

+ (BntHardwareInfo *) hardwareInfoAnalyse;

@end
