//
//  TableViewCell.m
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/17.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import "TableViewCell.h"
#import "BntMapIMP.h"
#import "BntlocationResponse.h"

@interface TableViewCell ()

@property (nonatomic, strong) UILabel *titleLab;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews{
    [self addSubview:self.titleLab];
}

- (void)interactData:(NSMutableArray *)dataArr onIndex:(NSInteger)index{
    BntLoc_AttenResponse *response = dataArr[index];
    _titleLab.text = [NSString stringWithFormat:@"ReGoecode:%@\n\n地理位置  (%.4f，%.4f)\n requestTimestamp:\n%@\n responseTimestamp:\n%@",response.locResponse.regeocode.formattedAddress,
                      response.locResponse.location.coordinate.latitude,
                      response.locResponse.location.coordinate.longitude,
                      response.requestTimestamp,
                      response.responseTimestamp];
}

- (UILabel *)titleLab{
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(20, 5, 300, 150);
        _titleLab.font = [UIFont boldSystemFontOfSize:15];
        _titleLab.numberOfLines = 0;
        
    }
    return _titleLab;
}


@end
