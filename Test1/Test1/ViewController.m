//
//  ViewController.m
//  Test1
//
//  Created by 朱封毅 on 27/06/15.
//  Copyright (c) 2015年 朱封毅. All rights reserved.
//

#import "ViewController.h"
 
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.view.backgroundColor=[UIColor redColor];
    // 先实例化一个图片对象
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    
    //定义一个数组
    NSMutableArray *imageArr =[NSMutableArray array];
    for (int i=1; i<24; i++) {
        NSString *imageStr =[NSString stringWithFormat:@"%d.jpg",i];
        UIImage  *image =[UIImage imageNamed:imageStr];
        [imageArr addObject:image];
    }
    imageView.animationImages=imageArr;
    //动画执行时间
    imageView.animationDuration=48;
    //重复次数
    imageView.animationRepeatCount=0;
    
    [imageView startAnimating];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
