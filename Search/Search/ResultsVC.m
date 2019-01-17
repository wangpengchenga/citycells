//
//  ResultsVC.m
//  Search
//
//  Created by Lijian on 2019/1/16.
//  Copyright © 2019 lijian. All rights reserved.
//

#import "ResultsVC.h"

@interface ResultsVC () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ResultsVC

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor redColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s",__FUNCTION__);
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索结果";
    self.view.backgroundColor = [UIColor yellowColor];
    
}

-(void)setResults:(NSArray *)results {
    NSLog(@"%s",__FUNCTION__);
    _results = results;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *flag=@"cellFlag";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:flag];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:flag];
    }
    [cell.textLabel setText:self.results[indexPath.row]];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

@end
