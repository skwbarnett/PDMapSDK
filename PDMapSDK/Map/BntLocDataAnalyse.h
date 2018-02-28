//
//  BntLocDataAnalyse.h
//  PDMapSDK
//
//  Created by Barnett Wu on 2016/11/16.
//  Copyright © 2016年 Barnett Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BntMapIMP.h"
#import "BntlocationResponse.h"
#import "BntLoc_AttenResponse.h"

@interface BntLocDataAnalyse : NSObject

+ (BntLocationReGeocode *)regeocodeAnalyse:(id)oriGeocode;

//  AMap response Analyse
+ (BntlocationResponse *)locationResponseAnalyse:(CLLocation *)location regoecode:(id)oriGeocode error:(id)error;

//  loc_Attendance response
+ (BntLoc_AttenResponse *)loc_AttendanceResponse_locationRequest:(BntAtten_LocRequest *)request location:(CLLocation *)location regoecode:(id)oriGeocode error:(id)error;

//  AMap Configure
+ (void)AMaplocationConfigure:(BntLocationConfigure *)locConfigure AMapManager:(AMapLocationManager *)manager;


@end
