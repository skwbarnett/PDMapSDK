//
//  NSDate+Bnt.h
//  BntEquipment
//
//  Created by 吴克赛 on 2016/12/5.
//  Copyright © 2016年 Barnett Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Bnt)

+ (NSTimeInterval)timenowInterval;

+ (NSTimeInterval)timeNowBetweenInterval:(NSTimeInterval)timeInterval;

//  yyyy年MM月dd号 HH:mm:ss
+ (NSDate *)dateFromString:(NSString *)string;

+ (NSTimeInterval)intervalNowBetweenString:(NSString *)string;

@end
