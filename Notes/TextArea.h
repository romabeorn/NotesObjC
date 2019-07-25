//
//  TextArea.h
//  Notes
//
//  Created by Roman Matveev on 24/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//


#import <Foundation/Foundation.h>
@import CoreData;

NS_ASSUME_NONNULL_BEGIN

@interface TextArea : NSManagedObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *text;

@end

NS_ASSUME_NONNULL_END
