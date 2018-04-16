//
//  ASettingManager.h
//  aVoice
//
//  Created by aronliang on 2017/6/25.
//  Copyright © 2017年 aliexpress. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ASettingManager : NSObject

+ (instancetype)shareInstance;

@property(nonatomic,strong)NSString* userType;
@property(nonatomic,assign)BOOL isNeedReload;

@end
