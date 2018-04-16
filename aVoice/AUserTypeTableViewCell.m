//
//  AUserTypeTableViewCell.m
//  aVoice
//
//  Created by aronliang on 2017/6/25.
//  Copyright © 2017年 aliexpress. All rights reserved.
//

#import "AUserTypeTableViewCell.h"
#import "ASettingManager.h"

@implementation AUserTypeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)userTypeChange:(id)sender {
    
    UISwitch* switchUserType = (UISwitch*) sender;
    if(switchUserType.tag == 0){
        if(switchUserType.on){
            [ASettingManager shareInstance].userType = @"children";
        }
        else{
            [ASettingManager shareInstance].userType = @"adult";
        }
    }
    else {
        if(switchUserType.on){
            [ASettingManager shareInstance].userType = @"root";
        }
        else{
            [ASettingManager shareInstance].userType = @"adult";
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
