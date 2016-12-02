//
//  MapLocationTableViewCell.m
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/21.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import "MapLocationTableViewCell.h"
#import "BntLoc_AttenResponse.h"

@interface MapLocationTableViewCell ()

@property (nonatomic, strong) UILabel *textLab;

@end

@implementation MapLocationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
        [self configureLayout];
    }
    return self;
}

- (void)interactData:(NSMutableArray *)dataMArr onIndex:(NSInteger)index{
    BntLoc_AttenResponse *locAtten = dataMArr[index];
    _textLab.text = [NSString stringWithFormat:@"打卡请求时间：%@\n打卡成功时间：%@\n\n打卡地点：%@\n\n地理位置：(%.4f , %.4f)"
                     ,locAtten.requestTimestamp,locAtten.responseTimestamp,locAtten.locResponse.regeocode.formattedAddress,locAtten.locResponse.location.coordinate.latitude,locAtten.locResponse.location.coordinate.longitude];
}

- (void)setupSubviews{
    [self addSubview:self.textLab];
}

- (void)configureLayout{
    _textLab.frame = CGRectMake(20, 30, 350, 150);
}

- (UILabel *)textLab{
    if (_textLab == nil) {
        _textLab = [[UILabel alloc] init];
        _textLab.numberOfLines = 0;
    }
    return _textLab;
}

@end
