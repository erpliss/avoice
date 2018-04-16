//
//  AChapterListViewModel.m
//  aVoice
//
//  Created by aronliang on 2017/6/25.
//  Copyright © 2017年 aliexpress. All rights reserved.
//

#import "AChapterListViewModel.h"
#import "ADataService.h"

@interface AChapterListViewModel()

@property ADataService* dataservice;

@end

@implementation AChapterListViewModel

-(id)initWithUserType:(NSString*)userType{
    if(self = [super init]){
        _userType = userType;
        _dataservice = [ADataService new];
        [self reload];
    }
    
    return self;
}

-(void)reload{
    _iTemList = [_dataservice getChapterList:_userType];
}
@end
