//
//  AppHeader.h
//  PuDong_iOS
//
//  Created by Barnett Wu on 16/6/14.
//  Copyright © 2016年 PUDONG. All rights reserved.
//

//#import "UIView+Bnt.h"

#ifndef AppHeader_h
#define AppHeader_h

//获取屏幕 宽度、高度
#define SCREEN_HEIGHT     [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH      [UIScreen mainScreen].bounds.size.width
#define SCREEN_BOUNDS ([UIScreen mainScreen].bounds)
//#define BntKeyWindow [UIApplication sharedApplication].keyWindow
#define BntKeyWindow ((AppDelegate *)[UIApplication sharedApplication].delegate).window

/**
 *  屏幕比例适配
 */
#define BntLength(W) [UIView bnt_configureWidth:(W)]
#define BntAltitude(H) [UIView bnt_configureHeight:(H)]
#define BntALine [UIView bnt_configureHeight:(1)]
/**
 *  颜色
 */
#define ColorMainGreen [UIColor colorWithHexString:@"#50B7AF"]
#define ColorText [UIColor colorWithHexString:@"#000000"]

/************************Color************************/
//3.5.0之前 背景灰色
//#define kGrayBackColor [UIColor colorWithRed:235/255.0 green:235/255.0 blue:244/255.0 alpha:1]
//3.5.0 修改背景灰色
#define kGrayBackColor [UIColor colorWithHexString:@"#F9F9F9"]
#define kGrayFontColor [UIColor colorWithRed:195/255.0 green:195/255.0 blue:195/255.0 alpha:1]
#define kMainGreenColor [UIColor colorWithRed:80/255.0 green:183/255.0 blue:175/255.0 alpha:1]
#define kGrayPartLineColor [UIColor colorWithRed:115/255.0 green:115/255.0 blue:115/255.0 alpha:1]

#define ColorGrayBack   [UIColor colorWithHexString:@"f3f3f3"]

#define ColorGrayFont   [UIColor colorWithRed:195/255.0 green:195/255.0 blue:195/255.0 alpha:1]
#define ColorGrayText_S2 [UIColor colorWithHexString:@"#CCCCCC"]
#define ColorGrayText_U1 [UIColor colorWithHexString:@"#555555"]

#define ColorGrayLine   [UIColor colorWithHexString:@"#B3B3B3"]
#define ColorMain       [UIColor colorWithHexString:@"#61c1bd"]
#define ColorSMain       [UIColor colorWithHexString:@"#45cfc9"]
#define ColorLine       [UIColor colorWithRed:115/255.0 green:115/255.0 blue:115/255.0 alpha:1]
#define ColorWhiteText  [UIColor colorWithHexString:@"#D3DDE5"]
//
#define ColorHUD [UIColor colorWithHexString:@"#1FB9C7"]
#define ColorHUD_2 [UIColor colorWithHexString:@"#1385FF"]
#define ColorHUD_3 [UIColor colorWithHexString:@"#1A7CD1"]

#define ColorText_3  [UIColor colorWithHexString:@"#333333"]
#define ColorText_2  [UIColor colorWithHexString:@"#666666"]
#define ColorText_1  [UIColor colorWithHexString:@"#a8a8a8"]

#define ColorLine_2  [UIColor colorWithHexString:@"#E0E0E0"]
#define ColorLine_1  [UIColor colorWithHexString:@"#EEEEEE"]

#define ColorYellow_1  [UIColor colorWithHexString:@"#FFC202"]
#define ColorYellow_2  [UIColor colorWithHexString:@"#FFA22A"]

#define ColorBack  [UIColor colorWithHexString:@"#f9f9f9"]

#define ColorRed   [UIColor colorWithHexString:@"#ff6058"]
#define ColorRed_1   [UIColor colorWithHexString:@"#ff0c00"]

#define PDColor(C) [UIColor colorWithHexString:C]

//进度条色彩
//偏低	srisk
//正常	normal
//风险	risk
//危险	danger
#define kSriskColor [UIColor colorWithRed:77/255.0 green:200/255.0 blue:229/255.0 alpha:1]
#define kNormalColor [UIColor colorWithRed:129/255.0 green:201/255.0 blue:6/255.0 alpha:1]
#define kriskColor [UIColor colorWithRed:253/255.0 green:144/255.0 blue:33/255.0 alpha:1]
#define kDangerColor [UIColor colorWithRed:244/255.0 green:85/255.0 blue:65/255.0 alpha:1]


//  font
//#define FONT(F,P) [UIFont systemFontOfSize:(iPad?P:F)]
#define Font(F) [UIFont bnt_configure:(F)]
#define FontDefault [UIFont bnt_configure:(13)]
#define FontBold(F) [UIFont bnt_BoldConfigure:(F)]
#define FontM   [UIFont bnt_configure:(14)]

/************************本地存储最新线上版本的key************************/
#define kOnlineVersionKey @"onlineVersion"


#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#endif /* AppHeader_h */
