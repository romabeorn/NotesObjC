//
//  NotesTableViewController.h
//  Notes
//
//  Created by Roman Matveev on 25/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteTableViewCell.h"
#import "CoreDataStack.h"
#import "TextArea.h"
#import "NoteView.h"
#import "Driver.h"

@interface NotesTableViewController : UIViewController

@property (nonatomic, strong) UITableView *NotesTableView;
@property (nonatomic, assign) NSInteger NotesCount;
@property (nonatomic, strong) NSMutableArray <TextArea *> *Notes;

@end


