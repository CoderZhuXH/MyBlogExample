//
//  ViewController.m
//  LoadAndInitializeExample
//
//  Created by zhuxiaohui on 2017/5/3.
//  Copyright © 2017年 zhuxiaohui. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Student.h"
#import "Teacher.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[Person new];
    //[Teacher new];
    [Student new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
