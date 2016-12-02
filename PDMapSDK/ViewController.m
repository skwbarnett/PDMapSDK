//
//  ViewController.m
//  PDMapSDK
//
//  Created by Barnett Wu on 2016/11/15.
//  Copyright © 2016年 Barnett Wu. All rights reserved.
//

#import "ViewController.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import <MAMapKit/MAMapKit.h>

#import "BntAttendanceManager.h"
#import "TableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:cellId];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}
static NSString *const cellId = @"attendanceCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    [cell interactData:self.dataArr onIndex:indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor lightGrayColor];
    button.frame = CGRectMake(20, 60, 375 - 40, 44);
    [button addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"定位" forState:UIControlStateNormal];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    [view addSubview:button];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 130;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (void)ButtonClick:(UIButton *)button{
    __weak typeof (self)weakSelf = self;
    BntAttendanceManager *manager = [BntAttendanceManager defaultManager];
    BntAttendanceCommand *command = [BntAttendanceCommand command];
    command.commandId = @(1001).stringValue;
    command.commandType = AttendanceCommandTypeLocation;
    __block int i = 0;
//    for (; i < 3; i ++) {
    [manager locationUnderCommand:command success:^(BntLoc_AttenResponse *response) {
        [weakSelf.dataArr addObject:response];
        [weakSelf.tableView reloadData];
        i = 3;
    } failure:^(BntLoc_AttenResponse *response) {
        NSLog(@"%@",response);
        [weakSelf.dataArr addObject:response];
        [weakSelf.tableView reloadData];
    }];
//    }
}

- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end
