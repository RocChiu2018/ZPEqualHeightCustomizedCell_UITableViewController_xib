//
//  ZPTableViewController.m
//  用storyboard自定义等高的cell
//
//  Created by apple on 16/5/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPTableViewController.h"
#import "ZPDeal.h"
#import "ZPTableViewCell.h"

@interface ZPTableViewController ()

@property (nonatomic, strong) NSArray *deals;

@end

@implementation ZPTableViewController

#pragma mark ————— 懒加载 —————
-(NSArray *)deals
{
    if (_deals == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"deals" ofType:@"plist"];
        NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dic in dicArray)
        {
            //把字典封装成对象
            ZPDeal *deal = [ZPDeal dealWithDict:dic];
            [tempArray addObject:deal];
        }
        
        _deals = tempArray;
    }
    
    return _deals;
}

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     如果不在自定义cell类中撰写加载xib文件的相关代码的话，就要在视图控制器类中的viewDidLoad方法中注册nib文件。
     */
//    UINib *nib = [UINib nibWithNibName:NSStringFromClass([ZPTableViewCell class]) bundle:nil];
//    [self.tableView registerNib:nib forCellReuseIdentifier:@"deal"];
}

#pragma mark ————— UITableViewDataSource —————
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.deals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZPTableViewCell *cell = [ZPTableViewCell cellWithTableView:tableView];
    
    cell.deal = [self.deals objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
