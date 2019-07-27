//
//  NoteView.m
//  Name Notes
//
//  Created by Roman Matveev on 24/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//

#import "NoteView.h"
#import "CoreDataStack.h"
#import "TextArea.h"
@interface NoteView () <UITextViewDelegate>

@property (nonatomic, strong) UITextView *TextArea;
@property (nonatomic, strong) TextArea *NoteEntity;
@end

@implementation NoteView

- (void)viewDidLoad
{
    [self prepareUI];
}

- (void)prepareUI
{
    [super viewDidLoad];
    self.TextArea = [[UITextView alloc] initWithFrame:self.view.frame];
    
    // Кнопка назад
    self.navigationItem.hidesBackButton = YES;
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    // Скачивание заметки
    NSManagedObjectContext *viewContext = [CoreDataStack shared].viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                    initWithEntityName:@"TextArea"];
    NSArray *tmpData = [viewContext executeFetchRequest:fetchRequest
                                                  error:nil];
    for(TextArea *object in tmpData){
        if ([object valueForKey:@"name"] == self.Name)
        {
            self.NoteEntity = object;
            NSString *text = [object valueForKey:@"text"];
            if (text == nil)
                text = @"";
            [self.TextArea setText:[NSString stringWithFormat:@"%@", text] ];
        }
    }
    
    // Настрока заметки
    [self setTextAreaSettings];
    [self.view addSubview:self.TextArea];
}

// Перехват кнопки возврата
- (void) back:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    self.editCell();
}

// Настройка textView
-(void)setTextAreaSettings
{
    [self.TextArea setFont:[UIFont systemFontOfSize:22]];
    self.TextArea.returnKeyType = UIReturnKeyDone;
    self.TextArea.delegate = self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesbegan with event:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

// Изменение заметки в любом виде
- (void)textViewDidChange:(UITextView *)textView
{
    NSManagedObjectContext *viewContext = [CoreDataStack shared].viewContext;
    [viewContext performBlock:^{
        if ([textView.text isEqualToString:@""])
            self.title = self.Name;
        else
            self.title = textView.text;
        self.NoteEntity.text = textView.text;
        [viewContext save:nil];
    }];
    
    
}

// Прокрутка заметки
- (void)positionTextView {
    NSRange lastLine = NSMakeRange(self.TextArea.text.length - 1, 1);
    [self.TextArea scrollRangeToVisible:lastLine];
}
@end
