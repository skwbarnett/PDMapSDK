//
//  BntLocationReGeocode.m
//  PDMapSDK
//
//  Created by Barnett Wu on 2016/11/16.
//  Copyright © 2016年 Barnett Wu. All rights reserved.
//

#import "BntLocationReGeocode.h"

@implementation BntLocationReGeocode

- (NSString *)description{
    return  [NSString stringWithFormat:@"BntReGeo地址:%@%@%@%@%@%@%@",_country,_province,_city,_district,_street,_number,_POIName];
}

@end
