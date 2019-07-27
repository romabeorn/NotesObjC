//
//  Driver.h
//  Notes
//
//  Created by Roman Matveev on 28/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../TextArea.h"
#import "../CoreDataStack.h"

@interface Driver : NSObject

- (NSArray<TextArea *> *)getEntities;

@end

