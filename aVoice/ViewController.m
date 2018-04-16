//
//  ViewController.m
//  aVoice
//
//  Created by aronliang on 2017/6/22.
//  Copyright © 2017年 aliexpress. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ListTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化语音播报
    AVSpeechSynthesizer * av = [[AVSpeechSynthesizer alloc]init];
    //设置播报的内容
    AVSpeechUtterance * utterance = [[AVSpeechUtterance alloc]initWithString:@"语音播报"];
    //设置语言类别
    AVSpeechSynthesisVoice * voiceType = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    utterance.voice = voiceType;
    //设置播报语速
    utterance.rate = 0.5;
    [av speakUtterance:utterance];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)speakOnclick:(id)sender {
    ListTableViewController* listVC = [[ListTableViewController alloc] init];
    [self.navigationController pushViewController:listVC animated:YES];
}
@end
