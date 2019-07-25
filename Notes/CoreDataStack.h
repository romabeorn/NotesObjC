//
//  CoreDataStack.h
//  Notes
//
//  Created by Roman Matveev on 24/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//
#import <Foundation/Foundation.h>
@import CoreData;

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataStack : NSObject

+ (instancetype)shared;

@property (nonatomic, strong) NSManagedObjectContext *viewContext;
@end

NS_ASSUME_NONNULL_END
