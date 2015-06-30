//
//  ViewController.m
//  test2
//
//  Created by 朱封毅 on 27/06/15.
//  Copyright (c) 2015年 朱封毅. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "AppCell.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray   *dataArray;
    UITableView      *MytableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //初始化数组，给数组一个存放数据的空间
    dataArray = [[NSMutableArray alloc]init];
    [self createTableView];
    //调用数据请求方法
    [self requstData];
    
    
}

//创建表格视图，用户展示界面整体的数据
-(void)createTableView
{
    //初始化一个tabbleview
    MytableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //设置如何显示的代理
    MytableView.delegate=self;
    //设置数据源的代理
    MytableView.dataSource = self;
     //设置背景颜色
    MytableView.backgroundColor =[UIColor whiteColor];
    //放到当前视图上
    [self.view addSubview:MytableView];
}
//我们创建完成UI后，需要接着去请求数据
-(void)requstData
{
    AFHTTPRequestOperationManager  *manager =[[AFHTTPRequestOperationManager alloc]init];
    //参数说明：
    //1 post:传递一个字符串类型的接口链接
    //2  parameters 要向服务器发送的参数：一般是字典格式：比如用户名密码
    //success 执行这个方法，如果方法执行成功；则调用success，否则调用failure
    NSString *urlString = @"http://api.yi18.net/news/list";
    [manager POST:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       // NSLog(@"responseObject =====%@",responseObject);
        //把现在完成的数据，赋值给已经初始化完成的数组
        if ([[responseObject objectForKey:@"success"] intValue]==1) {
         dataArray =[responseObject objectForKey:@"yi18"];
            [MytableView reloadData];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
    }];
    NSLog(@"----");
}

#pragma mark  ----TableViewDelegate 
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //定义盘子的id，使用static
    static NSString *cellID = @"CELL";
    //从当前的tabbleview的复用队列中找盘子，如果我有空盘子，那么就不需要新建一个，直接利用已经有的，如果没有的话，需要alloc一个
    //cell服用机制的根本原因是优化tabbleview，防止tabbleview卡顿
    AppCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell =[[AppCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //打印indexpath.row
    NSLog(@"indexpath.row ===%ld",(long)indexPath.row);
    NSDictionary  *dict =[dataArray objectAtIndex:indexPath.row];
    //cell.textLabel.text =[dict objectForKey:@"title"];
    cell.titleLable.text= [dict objectForKey:@"title"];
    ///  参数说明
    //1 nsurl  图片网络url地址
    //2 placeholderImage  预加载图片
    //3 options
    NSURL  *url =[NSURL URLWithString:[NSString stringWithFormat:@"http://www.yi18.net/%@",[dict objectForKey:@"img"]]];
    
    [cell.logoImage sd_setImageWithURL:url placeholderImage:nil options:(SDWebImageRetryFailed|SDWebImageLowPriority)];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
