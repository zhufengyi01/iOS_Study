//
//  AppCell.h
//  test2
//
//  Created by 朱封毅 on 27/06/15.
//  Copyright (c) 2015年 朱封毅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppCell : UITableViewCell
//@property 定义一个对象 是全局的，可以在.m中任何地方实现这个方法
///标题
@property(nonatomic,strong)UILabel  *titleLable;
//右边的图片
@property(nonatomic,strong) UIImageView  *logoImage;

@end
