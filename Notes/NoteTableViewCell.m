//
//  NoteTableViewCell.m
//  Notes
//
//  Created by Roman Matveev on 25/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//

#import "NoteTableViewCell.h"

@interface NoteTableViewCell ()

@property (nonatomic, strong) UILabel *Name;

@end

@implementation NoteTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //        self.backgroundColor = [UIColor ];
        _Name = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, UIScreen.mainScreen.bounds.size.width - 5 * 2, 20)];
        _Name.text = @"";
        [self.contentView addSubview:_Name];
    }
    
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.Name.text = nil;
}


@end
