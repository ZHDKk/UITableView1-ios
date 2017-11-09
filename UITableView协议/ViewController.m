//
//  ViewController.m
//  UITableView协议
//
//  Created by zh dk on 2017/8/28.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建数据视图对象
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 320, 536) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    _arrayData = [[NSMutableArray alloc] init];
    
    for (int i ='A'; i<='Z'; i++) {
        NSMutableArray *arraySmall = [[NSMutableArray alloc] init];
        for (int j = 1; j<=5; j++) {
            NSString *str=[NSString stringWithFormat:@"%c%d",i,j];
            [arraySmall addObject:str];
        }
        
        //生成一个二维数组
        [_arrayData addObject:arraySmall];
    }
}

//获取每组的元素
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numRow = [[_arrayData objectAtIndex:section] count];
    return numRow;
    
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strCell =@"cell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:strCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
        
    }
    cell.textLabel.text = _arrayData[indexPath.section][indexPath.row];
    return cell;
}
//获取组数
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _arrayData.count;
}

//获取单元格高度
-(CGFloat) tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

//每组头部标题
-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"头部标题";
}

//每组尾部标题
-(NSString*) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"尾部标题";
}

//获取头部高度
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
//获取尾部高度
-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 60;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
