//
//  ADataService.h
//  aVoice
//
//  Created by aronliang on 2017/6/22.
//  Copyright © 2017年 aliexpress. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ADataService : NSObject

-(NSMutableArray*) getChapterList:(NSString*)userType;
-(NSMutableArray*) getWordList:(NSString*)userType chapter:(NSString*)chapter;


@end
