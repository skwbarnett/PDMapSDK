//
//  PDDataExtension.m
//  PuDong_iOS
//
//  Created by 吴克赛 on 2016/11/10.
//  Copyright © 2016年 PuDong. All rights reserved.
//

#import "PDDataExtension.h"
#import <objc/runtime.h>

@implementation PDDataExtension

+ (NSMutableArray *)getProperties:(Class)classKind{
    NSMutableArray *propertiesMArr = [NSMutableArray array];
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(classKind, &count);

    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [propertiesMArr addObject:name];
    }
    return propertiesMArr;
}

+ (NSDictionary *)propertyExchangeKeyValue:(id)object{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSArray *proNameMArr = [PDDataExtension getProperties:[object class]];
    for (NSString *proName in proNameMArr) {
        id value = [object valueForKey:proName];
        if (value) {
            [param setValue:value forKey:proName];
        }
    }
    return param;
}

@end
