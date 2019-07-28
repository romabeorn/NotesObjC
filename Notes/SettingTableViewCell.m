//
//  SettingTableViewCell.m
//  Notes
//
//  Created by Roman Matveev on 28/07/2019.
//  Copyright © 2019 Roman Matveev. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _SettingName = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, UIScreen.mainScreen.bounds.size.width - 5 * 2, 20)];
        _SettingName.text = @"";
        [self.contentView addSubview:_SettingName];
    }
    
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    _SettingName.text = nil;
}
@end
