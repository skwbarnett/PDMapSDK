//
//  BntLocationReGeocode.h
//  PDMapSDK
//
//  Created by Barnett Wu on 2016/11/16.
//  Copyright © 2016年 Barnett Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BntLocationReGeocode : NSObject

@property (nonatomic, copy) NSString *formattedAddress;//!< 格式化地址

@property (nonatomic, copy) NSString *country;  //!< 国家
@property (nonatomic, copy) NSString *province; //!< 省/直辖市
@property (nonatomic, copy) NSString *city;     //!< 市
@property (nonatomic, copy) NSString *district; //!< 区
@property (nonatomic, copy) NSString *citycode; //!< 城市编码
@property (nonatomic, copy) NSString *adcode;   //!< 区域编码

@property (nonatomic, copy) NSString *street;   //!< 街道名称
@property (nonatomic, copy) NSString *number;   //!< 门牌号

@property (nonatomic, copy) NSString *POIName;  //!< 兴趣点名称
@property (nonatomic, copy) NSString *AOIName;  //!< 所属兴趣点名称

//- (NSString *)description;

@end
