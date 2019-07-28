//
//  SettingsTableViewController.m
//  Notes
//
//  Created by Roman Matveev on 28/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "Driver.h"
#import "ViewController.h"

@interface SettingsTableViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.SettingsTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.SettingsTableView registerClass:[SettingTableViewCell class] forCellReuseIdentifier:@"SettingCell"];
    self.SettingsTableView.delegate = self;
    self.SettingsTableView.dataSource = self;
    
    [self.view addSubview:self.SettingsTableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell" forIndexPath:indexPath];
//
     if ((int)indexPath.row == 0)
     {
         cell.SettingName.text = @"Удалить все заметки";
     }
 
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((int)indexPath.row == 0)
    {
        [Driver deleteAllNotes];
        ViewController *notes = [ViewController new];
        notes.title = @"Заметки";
        
        // Settings
        SettingsTableViewController *settings = [SettingsTableViewController new];
        settings.title = @"Настройки";
        
        // Table
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:notes];
        navigationController.tabBarItem.title = @"Заметки";
        
        [self.tabBarController setViewControllers:@[navigationController, settings]];
    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
