//
//  AUINavigationController.m
//  aVoice
//
//  Created by aronliang on 2017/6/24.
//  Copyright © 2017年 aliexpress. All rights reserved.
//

#import "AUINavigationController.h"

@interface AUINavigationController ()

@end

@implementation AUINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController* destination = segue.destinationViewController;
    if([destination respondsToSelector:@selector(setUserType:)]){
        [destination setValue:[sender valueForKey:@"userType"] forKey:@"userType"];
    }
}

@end
