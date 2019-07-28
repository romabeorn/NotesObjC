//
//  SettingsViewController.m
//  Notes
//
//  Created by Roman Matveev on 28/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (nonatomic, strong) SettingsTableViewController *vc;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.vc = [SettingsTableViewController new];
    
    self.vc.view.frame = self.view.frame;
    [self addChildViewController:self.vc];
    [self.view addSubview:self.vc.view];
    [self.vc didMoveToParentViewController:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
