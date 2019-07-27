//
//  ViewController.m
//  Name Notes
//
//  Created by Roman Matveev on 24/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataStack.h"
#import "TextArea.h"

@interface ViewController ()

@property (nonatomic, strong) NotesTableViewController *vc;
//@property (nonatomic, strong) NoteView *vc;

@property (nonatomic, assign) CGFloat topPadding;
@property (nonatomic, assign) CGFloat bottomPadding;

@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) UITabBarController *tabBarController;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vc = [NotesTableViewController new];
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addCell)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
    //    ==NoteView==
    //    self.vc = [NoteView new];
    self.vc.view.frame = self.view.frame;
    [self addChildViewController:self.vc];
    [self.view addSubview:self.vc.view];
    [self.vc didMoveToParentViewController:self];
    
}

- (void)addCell
{
    //ДОБАВЛЕНИЕ В БАЗУ ДАННЫХ
    NSManagedObjectContext *viewContext = [CoreDataStack shared].viewContext;
    [viewContext performBlockAndWait:^{
        TextArea *textArea = [[TextArea alloc] initWithContext:viewContext];
        textArea.name = [NSString stringWithFormat:@"Заметка %li", self.vc.NotesCount];
        textArea.text = @"";
        [self.vc.Notes addObject:textArea];
        [viewContext save:nil];
    }];
    
    // UI ДОБАВЛЕНИЕ
    [self.vc.NotesTableView beginUpdates];
    
    NoteTableViewCell *cell = [[NoteTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NoteCell"];
    self.vc.NotesCount += 1;
    cell.NoteCell.text = [NSString stringWithFormat:@"Заметка %li", self.vc.NotesCount];
    [self.vc.NotesTableView insertRowsAtIndexPaths:
     @[ [NSIndexPath  indexPathForRow:(self.vc.NotesCount - 1) inSection:0] ] withRowAnimation:UITableViewRowAnimationRight];
    
    [self.vc.NotesTableView endUpdates];
    
    // SCROLL
    [self.vc.NotesTableView scrollToRowAtIndexPath:[NSIndexPath  indexPathForRow:(self.vc.NotesCount - 1) inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    
}

@end
