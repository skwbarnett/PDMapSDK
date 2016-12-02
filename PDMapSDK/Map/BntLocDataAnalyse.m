//
//  BntLocDataAnalyse.m
//  PDMapSDK
//
//  Created by Barnett Wu on 2016/11/16.
//  Copyright © 2016年 Barnett Wu. All rights reserved.
//

#import "BntLocDataAnalyse.h"

@implementation BntLocDataAnalyse


#pragma mark - response

+ (BntlocationResponse *)locationResponseAnalyse:(CLLocation *)location regoecode:(id)oriGeocode error:(id)error{
    BntlocationResponse *response = [[BntlocationResponse alloc] init];
    response.location = location;
    response.regeocode = [BntLocDataAnalyse regeocodeAnalyse:oriGeocode];
    response.error = error;
    return response;
}

+ (BntLoc_AttenResponse *)loc_AttendanceResponse_locationRequest:(BntAtten_LocRequest *)request location:(CLLocation *)location regoecode:(id)oriGeocode error:(id)error{
    BntLoc_AttenResponse *response = [[BntLoc_AttenResponse alloc] init];
    response.locResponse = [BntLocDataAnalyse locationResponseAnalyse:location regoecode:oriGeocode error:error];
    response.responseId = request.requstId;
    response.hardwareInfo = request.hardwareInfo;
    response.requestTimestamp = request.date;
    response.responseTimestamp = [BntLocDataAnalyse nowDateString];
    
    return response;
}

+ (NSString *)nowDateString{
    NSDate *date = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy年MM月dd号 HH:mm:ss";
    NSString *dateString = [format stringFromDate:date];
    return dateString;
}

#pragma mark - regeocode

+ (BntLocationReGeocode *)regeocodeAnalyse:(id)oriGeocode
{
    BntLocationReGeocode *bntRegeocode = [[BntLocationReGeocode alloc] init];
    if ([oriGeocode isKindOfClass:[AMapLocationReGeocode class]]) {
        AMapLocationReGeocode *ampGeocode = oriGeocode;
        bntRegeocode.formattedAddress = ampGeocode.formattedAddress;
        bntRegeocode.country = ampGeocode.country;
        bntRegeocode.city = ampGeocode.city;
        bntRegeocode.district = ampGeocode.district;
        bntRegeocode.adcode = ampGeocode.adcode;
        bntRegeocode.street = ampGeocode.street;
        bntRegeocode.number = ampGeocode.number;
        bntRegeocode.POIName = ampGeocode.POIName;
        bntRegeocode.AOIName = ampGeocode.AOIName;
    }
    return bntRegeocode;
}

+ (void)AMaplocationConfigure:(BntLocationConfigure *)locConfigure AMapManager:(AMapLocationManager *)manager{
    manager.distanceFilter = locConfigure.distanceFilter ? locConfigure.distanceFilter : kCLDistanceFilterNone;
    manager.desiredAccuracy = locConfigure.desiredAccuracy ? locConfigure.desiredAccuracy : kCLLocationAccuracyBest;
    manager.pausesLocationUpdatesAutomatically = locConfigure.pausesLocationUpdatesAutomatically;
    manager.allowsBackgroundLocationUpdates = locConfigure.allowsBackgroundLocationUpdates;
    manager.locationTimeout = locConfigure.locationTimeout > 2 ? locConfigure.locationTimeout : 2;
    manager.reGeocodeTimeout = locConfigure.reGeocodeTimeout > 2 ? locConfigure.reGeocodeTimeout : 2;
}

@end
