//
//  NoteTableViewCell.m
//  Notes
//
//  Created by Roman Matveev on 25/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//

#import "NoteTableViewCell.h"

@interface NoteTableViewCell ()

@property (nonatomic, strong) UILabel *NoteCell;

@end

@implementation NoteTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _NoteCell = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, UIScreen.mainScreen.bounds.size.width - 5 * 2, 20)];
        _NoteCell.text = @"";
        [self.contentView addSubview:_NoteCell];
    }
    
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    _NoteCell.text = nil;
}


@end
