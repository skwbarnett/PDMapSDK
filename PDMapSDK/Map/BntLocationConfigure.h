//
//  BntLocationConfigure.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/16.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BntMapIMP.h"

@interface BntLocationConfigure : NSObject



//  是否更新
@property (nonatomic, assign) BOOL updating;

/**
 *  设定定位的最小更新距离。默认为 kCLDistanceFilterNone 。
 */
@property(nonatomic, assign) CLLocationDistance distanceFilter;

/**
 *  设定定位精度。默认为 kCLLocationAccuracyBest 。
 */
@property(nonatomic, assign) CLLocationAccuracy desiredAccuracy;

/**
 *  指定定位是否会被系统自动暂停。默认为YES。
 */
@property(nonatomic, assign) BOOL pausesLocationUpdatesAutomatically;

/**
 *  是否允许后台定位。默认为NO。只在iOS 9.0及之后起作用。
 *
 *  设置为YES的时候必须保证 Background Modes 中的 Location updates 处于选中状态，否则会抛出异常。
 */
@property(nonatomic, assign) BOOL allowsBackgroundLocationUpdates;

/**
 *  指定单次定位超时时间,默认为10s。最小值是2s。注意单次定位请求前设置。
 */
@property(nonatomic, assign) NSInteger locationTimeout;

/**
 *  指定单次定位逆地理超时时间,默认为5s。最小值是2s。注意单次定位请求前设置。
 */
@property(nonatomic, assign) NSInteger reGeocodeTimeout;

@property(nonatomic) id error;

+ (BntLocationConfigure *)initlocationConfigure;

@end
