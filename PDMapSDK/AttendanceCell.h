//
//  AttendanceCell.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/18.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, attendanceType) {
    AttendanceCellTypeOnDuty,
    AttendanceCellTypeOffDuty,
    AttendanceCellTypeActivity,
};

@interface AttendanceCell : UITableViewCell

@end
