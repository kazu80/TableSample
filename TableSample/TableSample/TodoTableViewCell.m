//
//  TodoTableViewCell.m
//  TableSample
//
//  Created by kazuyoshi kawakami on 13/07/03.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import "TodoTableViewCell.h"

@implementation TodoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
