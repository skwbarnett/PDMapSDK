//
//  MapLocationController.m
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/21.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import "MapLocationController.h"
#import "MapLocationTableViewCell.h"
#import "PDApiAtten_Request.h"
#import "PDMapApiKit.h"
#import "PDApiAtten_ConfirmRequest.h"
#import "PDApiAtten_StatusRequest.h"
#import "MBProgressHUD+Bnt.h"
#import "BntAttendanceManager.h"
#import "PDApiAttenAnalyse.h"

@interface MapLocationController ()

@property (nonatomic, strong) NSMutableArray *missionMArr;

@property (nonatomic, strong) NSMutableArray *locationMArr;

@end

@implementation MapLocationController

static NSString *cellId = @"cellid";

#pragma mark - Interact Data

- (void)interactMissionHTTP{
    __weak typeof (self)weakSelf = self;
    [BntMapHTTPManager Atten_List:nil success:^(id model) {
        weakSelf.missionMArr = model;
    }];
}

- (void)interactAttenStatus:(NSString *)attenId{
    
}

//  签到
- (void)interactConfirmHTTP:(NSString *)attenId location:(id)location{
    __weak typeof (self)weakSelf = self;
    
    PDApiAtten_ConfirmRequest *conRequest = [PDApiAttenAnalyse configureAttenConfirmRequest:location];
    conRequest.attendanceId = attenId;
    [BntMapHTTPManager Atten_Comfirm:conRequest success:^(id model) {
        [MBProgressHUD bnt_hideHUD];
        [weakSelf.locationMArr addObject:location];
        [weakSelf.tableView reloadData];
    }];
}

//  定位
- (void)attenMapLocation{
    __weak typeof (self)weakSelf = self;
    BntAttendanceManager *manager = [BntAttendanceManager defaultManager];
    BntAttendanceCommand *command = [BntAttendanceCommand command];
    command.commandId = @(1001).stringValue;
    command.commandType = AttendanceCommandTypeLocation;
    [MBProgressHUD showIndeterminate];
    [manager locationUnderCommand:command success:^(BntLoc_AttenResponse *response) {
        [weakSelf interactConfirmHTTP:@"12345" location:response];
    } failure:^(BntLoc_AttenResponse *response) {
        NSLog(@"%@",response);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.locationMArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 210;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *Label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 375, 80)];
    Label.font = [UIFont boldSystemFontOfSize:20];
    Label.numberOfLines = 0;
    Label.textAlignment = NSTextAlignmentCenter;
    Label.text = @"Attendance Service For\nHealthbok";
    [view addSubview:Label];
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MapLocationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    [cell interactData:self.locationMArr onIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)viewDidAppear:(BOOL)animated{
    [self headerConfigure];
}

#pragma mark construct layout

- (void)headerConfigure{
    //    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(80, 10, 200, 150)];
    //    header.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 612, 375, 55);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"签到" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(attenMapLocation) forControlEvents:UIControlEventTouchUpInside];
    [[UIApplication sharedApplication].keyWindow addSubview:button];
    //    [header addSubview:button];
}

- (void)setupView{
    [self.tableView registerClass:[MapLocationTableViewCell class] forCellReuseIdentifier:cellId];
    [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 60, 0)];
}


- (NSMutableArray *)missionMArr{
    if (_missionMArr == nil) {
        _missionMArr = [NSMutableArray array];
    }
    return _missionMArr;
}

- (NSMutableArray *)locationMArr{
    if (_locationMArr == nil) {
        _locationMArr = [NSMutableArray array];
    }
    return _locationMArr;
}

@end
