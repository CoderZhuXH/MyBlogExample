//
//  ViewController.m
//  RACExample
//
//  Created by zhuxiaohui on 2017/6/8.
//  Copyright © 2017年 zhuxiaohui. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC.h>
#import "Person.h"


@interface ViewController ()
@property(nonatomic,strong)Person *p;
@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)UITextField *tf;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.button];
    [self.view addSubview:self.tf];
    
    [self demo0];
    [self demo1];
    [self demo2];
    [self demo3];
    [self demo4];
}

-(void)demo0{

    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [subscriber sendNext:@"this is RAC"];
        return nil;
    }];
    
    
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    

}
//KVO
-(void)demo1{
    self.p = [[Person alloc] init];
    [RACObserve(self.p, name) subscribeNext:^(id  _Nullable x) {
        
        NSLog(@"%@",x);
        
    }];
}
//Target 点击事件
-(void)demo2
{
    [[self.button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        //x 为按钮本身
        NSLog(@"x=%@",x);
    }];
}
//监听文本框
-(void)demo3{

    [[self.tf rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        
        NSLog(@"x=%@",x);
    }];
}
//通知
-(void)demo4{

    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
       
        NSLog(@"x=%@",x);
        
    }];
}
#pragma mark - lazy
-(UIButton *)button
{
    if(_button==nil)
    {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 0, 100, 30);
        _button.backgroundColor = [UIColor blueColor];
    }
    return _button;

}
-(UITextField *)tf{
    
    if(_tf==nil)
    {
        _tf = [[UITextField alloc] initWithFrame:CGRectMake(0, 50, 100, 30)];
        _tf.backgroundColor = [UIColor darkGrayColor];
        _tf.placeholder = @"输入框";
    }
    return _tf;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
