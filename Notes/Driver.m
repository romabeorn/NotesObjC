//
//  Driver.m
//  Notes
//
//  Created by Roman Matveev on 28/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//

#import "Driver.h"

@implementation Driver

+ (NSArray<TextArea *> *)getNotesFromDB
{
    NSManagedObjectContext *viewContext = [CoreDataStack shared].viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                    initWithEntityName:@"TextArea"];
    NSArray *tmpData = [viewContext executeFetchRequest:fetchRequest
                                                  error:nil];
    return tmpData;
}

+ (void)deleteAllNotes
{
    for (TextArea *object in [Driver getNotesFromDB])
    {
        NSManagedObjectContext *viewContext = [CoreDataStack shared].viewContext;
        [viewContext deleteObject:object];
        [viewContext save:nil];
    }
}

@end
