//
//  AListViewModel.m
//  aVoice
//
//  Created by aronliang on 2017/6/22.
//  Copyright © 2017年 aliexpress. All rights reserved.
//

#import "AWordListViewModel.h"
#import "ADataService.h"

@implementation AEnglistItem


@end

@interface AWordListViewModel()

@property ADataService* dataservice;

@end

@implementation AWordListViewModel

-(id)init{
    if(self = [super init]){
        _dataservice = [ADataService new];
    }
    
    return self;
}

-(void)requestData{
    _iTemList = [_dataservice getWordList:_userType chapter:_chapter];
}
@end
