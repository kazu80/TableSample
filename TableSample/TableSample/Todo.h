//
//  Todo.h
//  TableSample
//
//  Created by kazuyoshi kawakami on 13/06/27.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject
@property (strong, nonatomic) NSString * task;
@property (strong, nonatomic) NSDate   * due;

+ (Todo *)todoWithTask:(NSString *)task due:(NSDate *)due;
+ (Todo *)todoWithTask:(NSString *)task dueDateAfter:(int)days;

- (NSString *)dueString;
- (NSString *)description;

@end
