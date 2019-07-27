//
//  NotesTableViewController.m
//  Notes
//
//  Created by Roman Matveev on 25/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//


#import "NotesTableViewController.h"

@interface NotesTableViewController () <UITableViewDelegate, UITableViewDataSource>



@end

@implementation NotesTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.NotesCount = 0;
    self.Notes = [[NSMutableArray array] mutableCopy];
    
    NSManagedObjectContext *viewContext = [CoreDataStack shared].viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                    initWithEntityName:@"TextArea"];
    NSArray *tmpData = [viewContext executeFetchRequest:fetchRequest
                                                  error:nil];
    for(TextArea *object in tmpData){
        self.NotesCount += 1;
        [self.Notes addObject:object];
        
    }
    
    self.NotesTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.NotesTableView];
    self.NotesTableView.delegate = self;
    self.NotesTableView.dataSource = self;
    [self.NotesTableView registerClass:[NoteTableViewCell class] forCellReuseIdentifier:@"NoteCell"];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoteCell" forIndexPath:indexPath];
    NSString *text = [self.Notes[indexPath.row] valueForKey:@"text"];
    if (text == nil)
        cell.Name.text = [self.Notes[indexPath.row] valueForKey:@"name"];
    else
        cell.Name.text = text;
    
    return cell;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Мои заметки";
    } else return @"Нет Заметок";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.NotesCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Удаление из базы и массива ячеек
        NSManagedObjectContext *viewContext = [CoreDataStack shared].viewContext;
        [viewContext deleteObject:self.Notes[indexPath.row]];
        self.NotesCount -= 1;
        [self.Notes removeObjectAtIndex:indexPath.row];
        [viewContext save:nil];
        
        //Удаление ячейки анимацмя
        [tableView performBatchUpdates:^{
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NoteView *noteController = [NoteView new];
    noteController.Name = [self.Notes[indexPath.row] valueForKey:@"name"];
    noteController.title = [self.Notes[indexPath.row] valueForKey:@"text"];
    
    noteController.editCell = ^(void){
        [tableView beginUpdates];
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        [tableView endUpdates];
    };
    [self.navigationController pushViewController:noteController animated:YES];
}

@end
