//
//  NSDate+Bnt.m
//  BntEquipment
//
//  Created by 吴克赛 on 2016/12/5.
//  Copyright © 2016年 Barnett Wu. All rights reserved.
//

#import "NSDate+Bnt.h"

@implementation NSDate (Bnt)

+ (NSTimeInterval)timenowInterval{
    return [[NSDate date] timeIntervalSince1970];
}

+ (NSTimeInterval)timeNowBetweenInterval:(NSTimeInterval)timeInterval{
    NSDate *nowDate = [NSDate date];
    return [nowDate timeIntervalSinceDate:[NSDate dateWithTimeIntervalSince1970:timeInterval]];
}

+ (NSDate *)dateFromString:(NSString *)string{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy年MM月dd号 HH:mm:ss";
    NSDate *date = [format dateFromString:string];
    return date;
}

+ (NSTimeInterval)intervalNowBetweenString:(NSString *)string{
    NSDate *date = [NSDate dateFromString:string];
    return [NSDate intervalNowBetweenDate:date];
}

+ (NSTimeInterval)intervalNowBetweenDate:(NSDate *)date{
    NSDate *nowDate = [NSDate date];
    return [nowDate timeIntervalSinceDate:date];
}

@end
