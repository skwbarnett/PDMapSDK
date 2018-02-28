//
//  AttendanceCell.m
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/18.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import "AttendanceCell.h"

@interface AttendanceCell ()

@property (nonatomic, assign) attendanceType type;

@property (nonatomic, assign) UIButton *attendanceButton;

@end

@implementation AttendanceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)interactData:(NSMutableArray *)dataArr{
    
}

- (void)setupSubviews{
    
}

- (void)constructLayout{
    
}

#pragma mark setter getter

- (UIButton *)attendanceButton{
    if (_attendanceButton == nil) {
        _attendanceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_attendanceButton setTitle:@"打卡任务" forState:UIControlStateNormal];
        
    }
    return _attendanceButton;
}


@end
