//
//  PDDataExtension.h
//  PuDong_iOS
//
//  Created by 吴克赛 on 2016/11/10.
//  Copyright © 2016年 PuDong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PDDataExtension : NSObject
//  全属性名
+ (NSMutableArray *)getProperties:(Class)classKind;

+ (NSDictionary *)propertyExchangeKeyValue:(id)object;

@end
