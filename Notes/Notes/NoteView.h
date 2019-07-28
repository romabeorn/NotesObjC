//
//  NoteView.h
//  Name Notes
//
//  Created by Roman Matveev on 24/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoteView : UIViewController

@property (nonatomic, strong) NSString *Name;
@property (nonatomic, copy) void (^editCell)(void);
@property (nonatomic, assign) int idNote;

@end

NS_ASSUME_NONNULL_END
