//
//  AChapterListViewModel.h
//  aVoice
//
//  Created by aronliang on 2017/6/25.
//  Copyright © 2017年 aliexpress. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AChapterListViewModel : NSObject

@property(nonatomic,strong)NSMutableArray* iTemList;
@property(nonatomic,strong)NSString* userType;

-(id)initWithUserType:(NSString*)userType;
-(void)reload;

@end
