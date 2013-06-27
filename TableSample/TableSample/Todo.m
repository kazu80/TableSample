//
//  Todo.m
//  TableSample
//
//  Created by kazuyoshi kawakami on 13/06/27.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import "Todo.h"

@implementation Todo

+ (Todo *)todoWithTask:(NSString *)task due:(NSDate *)due
{
    Todo * todo = [[Todo alloc] init];
    
    todo.task = task;
    todo.due  = due;
    
    return todo;
}

+ (Todo *)todoWithTask:(NSString *)task dueDateAfter:(int)days
{
    return [Todo todoWithTask:task due:[NSDate dateWithTimeIntervalSinceNow:(days * 60 * 60 * 24)]];
}

- (NSString *)dueString
{
    NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    
    return [dateFormat stringFromDate:_due];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Todo due:%@ task%@>", _due, _task];
}

@end
