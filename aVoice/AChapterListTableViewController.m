//
//  AChapterListTableViewController.m
//  aVoice
//
//  Created by aronliang on 2017/6/25.
//  Copyright © 2017年 aliexpress. All rights reserved.
//

#import "AChapterListTableViewController.h"
#import "AChapterListViewModel.h"
#import "ASettingManager.h"
#import "AWordListTableViewController.h"

@interface AChapterListTableViewController ()

@property(nonatomic,strong)AChapterListViewModel* chapterListViewModel;
@property(nonatomic,strong)NSString* userType;

@end

@implementation AChapterListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _userType = [ASettingManager shareInstance].userType;
    _chapterListViewModel = [[AChapterListViewModel alloc] initWithUserType:_userType];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    if([ASettingManager shareInstance].isNeedReload){
        [_chapterListViewModel reload];
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _chapterListViewModel.iTemList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kCapterCellIdentify" forIndexPath:indexPath];
    
    cell.textLabel.text = [_chapterListViewModel.iTemList objectAtIndex:indexPath.row];
    return cell;
}


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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AWordListTableViewController* destination = segue.destinationViewController;
    UITableViewCell* cell = sender;
    if([destination respondsToSelector:@selector(setChapter:)]){
        [destination setValue:cell.text forKey:@"chapter"];
    }
}


@end
