//
//  TodoDetailViewController.m
//  TableSample
//
//  Created by kazuyoshi kawakami on 13/07/08.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import "TodoDetailViewController.h"

@interface TodoDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *taskText;
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDate;

@end

@implementation TodoDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _taskText.text = _todo.task;
    _dueDate.date  = _todo.due;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    _todo.task = _taskText.text;
    _todo.due  = _dueDate.date;
}

@end
