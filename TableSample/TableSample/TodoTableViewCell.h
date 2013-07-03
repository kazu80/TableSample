//
//  TodoTableViewCell.h
//  TableSample
//
//  Created by kazuyoshi kawakami on 13/07/03.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (weak, nonatomic) IBOutlet UILabel *dueLabel;

@end
