//
//  CollectionViewCell.m
//  Notes
//
//  Created by Roman Matveev on 28/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _SettingName.text = @"";
    }
    
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    _SettingName.text = nil;
}

@end
