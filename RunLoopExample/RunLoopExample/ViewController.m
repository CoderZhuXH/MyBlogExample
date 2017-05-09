//
//  ViewController.m
//  RunLoopExample
//
//  Created by zhuxiaohui on 2017/5/8.
//  Copyright © 2017年 zhuxiaohui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    
    [runloop getCFRunLoop];
    

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
