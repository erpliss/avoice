//
//  AListViewModel.h
//  aVoice
//
//  Created by aronliang on 2017/6/22.
//  Copyright © 2017年 aliexpress. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AEnglistItem : NSObject

@property(nonatomic,strong)NSString* english;
@property(nonatomic,strong)NSString* chinese;

@end

@interface AWordListViewModel : NSObject

@property(nonatomic,strong)NSMutableArray* iTemList;
@property(nonatomic,strong)NSString* userType;
@property(nonatomic,strong)NSString* chapter;

-(id)initWithUserType:(NSString*)userType;
-(void)requestData;

@end
