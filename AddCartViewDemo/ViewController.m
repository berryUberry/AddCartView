//
//  ViewController.m
//  AddCartViewDemo
//
//  Created by 王凯 on 2017/1/12.
//  Copyright © 2017年 berryberry. All rights reserved.
//

#import "ViewController.h"
#import "AddCartView.h"
@interface ViewController ()
@property(nonatomic,strong)AddCartView *addcart;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.addcart = [[AddCartView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview: self.addcart];
    self.view.backgroundColor = [UIColor blackColor];
    UIButton *addButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    addButton.backgroundColor = [UIColor grayColor];
    [self.addcart addSubview:addButton];
    [addButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
}

-(void)add{
    [self.addcart play];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

