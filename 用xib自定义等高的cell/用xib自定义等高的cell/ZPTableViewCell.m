//
//  ZPTableViewCell.m
//  用storyboard自定义等高的cell
//
//  Created by apple on 16/5/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPTableViewCell.h"
#import "ZPDeal.h"

@interface ZPTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;

@end

@implementation ZPTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    NSString *ID = @"deal";
    
    ZPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    /**
     如果不在此方法中加载xib文件，就要在视图控制器类中的viewDidLoad方法中注册nib文件。
     */
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ZPTableViewCell class]) owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)setDeal:(ZPDeal *)deal
{
    _deal = deal;
    
    //设置数据
    self.iconView.image = [UIImage imageNamed:deal.icon];
    self.titleLabel.text = deal.title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥ %@", deal.price];
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@人已购买", deal.buyCount];
}

@end
