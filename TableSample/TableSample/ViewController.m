//
//  ViewController.m
//  TableSample
//
//  Created by kazuyoshi kawakami on 13/06/27.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import "ViewController.h"
#import "Todo.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray * todos;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTodo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTodo
{
    _todos = [[NSMutableArray alloc] init];
    [_todos addObject:[Todo todoWithTask:@"打ち合わせ" dueDateAfter:1]];
    [_todos addObject:[Todo todoWithTask:@"プログラミング" dueDateAfter:2]];
    [_todos addObject:[Todo todoWithTask:@"テスト" dueDateAfter:7]];
    [_todos addObject:[Todo todoWithTask:@"納入" dueDateAfter:10]];
}

// 何個データがあるか戻すメソッド
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"-- numberOfRowsInSection %d", [_todos count]);
    return [_todos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];
    
    Todo * todo = _todos[indexPath.row];
    NSLog(@"-- cellForRowAtIndexPath %d %@", indexPath.row, todo);
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ : %@", todo.dueString, todo.task];
    return cell;
}

@end
