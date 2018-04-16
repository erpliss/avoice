//
//  ASettingManager.m
//  aVoice
//
//  Created by aronliang on 2017/6/25.
//  Copyright © 2017年 aliexpress. All rights reserved.
//

#import "ASettingManager.h"

static ASettingManager* _staticInstance = nil;

@implementation ASettingManager

+ (instancetype)shareInstance{
    static dispatch_once_t oncetoken = nil;
    
    dispatch_once(&oncetoken,^{
        _staticInstance = [ASettingManager new];
    });
                  
    return _staticInstance;
}

-(instancetype)init{
    if(self = [super init]){
        _userType = [[NSUserDefaults standardUserDefaults] objectForKey:@"userType"];
        _isNeedReload = false;
    }
    
    return self;
}

-(void)setUserType:(NSString *)userType{
    _userType = userType;
    
    [[NSUserDefaults standardUserDefaults] setObject:userType forKey:@"userType"];
    _isNeedReload = YES;
}

@end
