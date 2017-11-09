//
//  ViewController.h
//  UITableView协议
//
//  Created by zh dk on 2017/8/28.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    UITableView *_tableView;
    
    //定义一个数据源
    NSMutableArray *_arrayData;
}


@end

