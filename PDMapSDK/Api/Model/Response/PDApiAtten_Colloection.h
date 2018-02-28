//
//  PDApiAtten_Colloection.h
//  PDMapSDK
//
//  Created by 吴克赛 on 2016/11/18.
//  Copyright © 2016年 吴克赛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PDApiAtten_List.h"

@interface PDApiAtten_Colloection : NSObject

@property (nonatomic, strong) PDApiAtten_List *daily;

@property (nonatomic, strong) PDApiAtten_List *activity;

@end
