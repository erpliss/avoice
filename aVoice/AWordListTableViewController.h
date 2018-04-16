//
//  ListTableViewController.h
//  aVoice
//
//  Created by aronliang on 2017/6/22.
//  Copyright © 2017年 aliexpress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AWordListTableViewController : UITableViewController

@property(nonatomic,strong)NSString* userType;
@property(nonatomic,strong)NSString* chapter;
@property (strong, nonatomic) IBOutlet UIButton *speakButton;

- (IBAction)speakButtonDown:(id)sender;

@end
