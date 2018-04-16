//
//  ListTableViewController.m
//  aVoice
//
//  Created by aronliang on 2017/6/22.
//  Copyright © 2017年 aliexpress. All rights reserved.
//

#import "AWordListTableViewController.h"
#import "AWordListViewModel.h"
#import "ATableViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import "ASettingManager.h"

@interface AWordListTableViewController ()

@property(nonatomic,strong)AWordListViewModel* listViewModel;
@property(nonatomic,strong)AVSpeechSynthesizer * AVSynthesizer;
@end

@implementation AWordListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

//    [self.tableView registerNib:[UINib nibWithNibName:@"ATableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"kCellIdentify"];
//    [self.tableView registerNib:[UINib nibWithNibName:@"ATableViewCell" bundle:nil ]forCellWithReuseIdentifier:@"kATableViewCell"];

//    [self.tableView registerClass:NSClassFromString(@"ATableViewCell") forCellReuseIdentifier:@"kCellIdentify"];
    
//    self.tableView.backgroundColor = [UIColor redColor];
//    self.tableView.dataSource = self;
//    self.tableView.delegate = self;
    _userType = [ASettingManager shareInstance].userType;
    _listViewModel = [[AWordListViewModel alloc] init];
    _listViewModel.userType = _userType;
    _listViewModel.chapter = _chapter;
    [_listViewModel requestData];
    _AVSynthesizer = [[AVSpeechSynthesizer alloc]init];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _listViewModel.iTemList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kWordCellIdentify"];
    
    AEnglistItem* item = [_listViewModel.iTemList objectAtIndex:indexPath.row];
    cell.EnglishLabel.text = item.english;
    cell.ChineseLabel.text = item.chinese;
    return cell;
}

- (IBAction)speakButtonDown:(id)sender{
    [_listViewModel.iTemList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self speakItem:obj];
    }];
}

-(void)speakItem:(AEnglistItem*)item{
    [self speakUtterance:item.english language:nil postUtteranceDelay:0 pitchMultiplier:1];
    [self speakUtterance:item.chinese language:@"zh-CN" postUtteranceDelay:0 pitchMultiplier:1];


    for(int index = 0 ; index < item.english.length; index++){
        NSString* character = [item.english substringWithRange:NSMakeRange(index, 1)];
        [self speakUtterance:[character lowercaseString] language:nil postUtteranceDelay:0 pitchMultiplier:1.5];
    }
    
    [self speakUtterance:item.english language:nil postUtteranceDelay:1 pitchMultiplier:1];
}

-(void)speakUtterance:(NSString*)string language:(NSString*)language postUtteranceDelay:(NSTimeInterval)postUtteranceDelay pitchMultiplier:(float)pitchMultiplier{
    AVSpeechUtterance * utterance = [[AVSpeechUtterance alloc]initWithString:string];
    
    if(!language){
        language = @"en-us";
    }
    
    AVSpeechSynthesisVoice * voiceType = [AVSpeechSynthesisVoice voiceWithLanguage:language];
    utterance.voice = voiceType;
    
    if([language isEqualToString:@"zh-CN"]){
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate;
    }
    
    
    utterance.postUtteranceDelay = postUtteranceDelay;
    utterance.pitchMultiplier = pitchMultiplier;

    
    [_AVSynthesizer speakUtterance:utterance];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AEnglistItem* item = [_listViewModel.iTemList objectAtIndex:indexPath.row];
    [self speakItem:item];
}
//-(UITableView*)tableView{
//    if(_tablev){
//        UITableView* tableView = [[UITableView alloc] init];
//    }
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
