//
//  AppDelegate.m
//  Notes
//
//  Created by Roman Matveev on 24/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SettingsTableViewController.h"
#import "Driver.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
//    [Driver deleteAllNotes];
    ViewController *notes = [ViewController new];
    notes.title = @"Заметки";
    
    // Settings
    SettingsTableViewController *settings = [SettingsTableViewController new];
    settings.title = @"Настройки";
    [settings.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Avenir-Light" size:20.0f]} forState:UIControlStateNormal];
    
    // Table
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:notes];
    navigationController.tabBarItem.title = @"Заметки";
    [navigationController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Avenir-Light" size:20.0f]} forState:UIControlStateNormal];
    
    UITabBarController *tabBarController = [UITabBarController new];
    tabBarController.viewControllers = @[navigationController, settings];
    self.window.rootViewController = tabBarController;
    
    return YES;
}


@end
