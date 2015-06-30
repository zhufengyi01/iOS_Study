//
//  AppCell.m
//  test2
//
//  Created by 朱封毅 on 27/06/15.
//  Copyright (c) 2015年 朱封毅. All rights reserved.
//

#import "AppCell.h"
#define  DeviceWidth [UIScreen mainScreen].bounds.size.width
@implementation AppCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //self.contentView.backgroundColor = [UIColor redColor];
        [self createCell];
    }
    return self;
}
-(void)createCell
{
   // self.titleLable
    
//    float  DeviceWidth  = [UIScreen mainScreen].bounds.size.width;
    
    _titleLable =[[UILabel alloc]initWithFrame:CGRectMake(10, 10, DeviceWidth-100, 40)];
    //为标签设置默认文本
    _titleLable.text =@"标题";
    //设置文字大小
    _titleLable.font =[UIFont systemFontOfSize:16];
    ///设置文字颜色
    _titleLable.textColor =[UIColor grayColor];
    //把标签添加到当前的cell
    //设置多少行
    //0 表示无数行  0 ，1 ，2 ,,,,,
    _titleLable.numberOfLines=0;
    [self.contentView addSubview:_titleLable];
    // 在此初始化图片视图
    _logoImage =[[UIImageView alloc]initWithFrame:CGRectMake(DeviceWidth-90, 10, 80, 60)];
    _logoImage.layer.cornerRadius=4;
    _logoImage.clipsToBounds=YES;
    _logoImage.backgroundColor =[UIColor yellowColor];
    [self.contentView addSubview:_logoImage];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
