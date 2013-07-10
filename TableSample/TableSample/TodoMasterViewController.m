//
//  ViewController.m
//  TableSample
//
//  Created by kazuyoshi kawakami on 13/06/27.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import "TodoMasterViewController.h"
#import "Todo.h"
#import "TodoTableViewCell.h"
#import "TodoDetailViewController.h"

@interface TodoMasterViewController ()

@property (strong, nonatomic) NSMutableArray * todos;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSIndexPath *updateIndexPath;

@end

@implementation TodoMasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTodo];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
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
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];
    TodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];
    
    Todo * todo = _todos[indexPath.row];
    NSLog(@"-- cellForRowAtIndexPath %d %@", indexPath.row, todo);
    
//    cell.textLabel.text = todo.task;
//    cell.detailTextLabel.text = todo.dueString;
    cell.taskLabel.text = todo.task;
    cell.dueLabel.text = todo.dueString;
    
//    cell.imageView.image = [UIImage imageNamed:@"smile.png"];
    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    return cell;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [_tableView setEditing:editing animated:animated];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"-- commitEditingStyle %d", indexPath.row);
        [_todos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    TodoDetailViewController *detailViewController = [segue destinationViewController];
    
    if ([[segue identifier] isEqualToString:@"new"]) {
        detailViewController.todo = [Todo todoWithTask:@"" dueDateAfter:0];
        _updateIndexPath = [NSIndexPath indexPathForRow:[_todos count] inSection:0];
    } else {
        _updateIndexPath = _tableView.indexPathForSelectedRow;
        detailViewController.todo = _todos[_updateIndexPath.row];
        [self.tableView deselectRowAtIndexPath:_tableView.indexPathForSelectedRow animated:YES];
    }
    
    NSLog(@"-- prepareForSegue %@ %d", [segue identifier], _updateIndexPath.row);
}

- (IBAction)todoUpdated:(UIStoryboardSegue *)segue
{
    NSLog(@"-- todoUpdated %d", _updateIndexPath.row);
    if (_updateIndexPath.row == [_todos count]) {
        TodoDetailViewController * detailViewController = [segue sourceViewController];
        [_todos addObject:detailViewController.todo];
        [_tableView insertRowsAtIndexPaths:@[_updateIndexPath] withRowAnimation:UITableViewRowAnimationNone];
        
    } else {
        [_tableView reloadRowsAtIndexPaths:@[_updateIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}



@end
