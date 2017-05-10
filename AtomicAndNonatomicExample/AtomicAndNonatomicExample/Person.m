//
//  Person.m
//  AtomicAndNonatomicExample
//
//  Created by zhuxiaohui on 2017/5/9.
//  Copyright © 2017年 zhuxiaohui. All rights reserved.
//

#import "Person.h"

//Person.m 使用 mrc 环境

@implementation Person
@synthesize icon = _icon;
@synthesize icon1 = _icon1;

#pragma mark  nonatomic

//set
-(void)setIcon:(UIImage *)icon
{
    if(_icon != icon)
    {
        [_icon release];
        _icon = [icon retain];
    }
}
//get
-(UIImage *)icon
{
    return _icon;
}



#pragma mark - atomic
//set
-(void)setIcon1:(UIImage *)icon1
{
    //同步代码块
    @synchronized (self) {
        
        if(_icon1 != icon1)
        {
            [_icon1 release];
            _icon1 = [icon1 retain];
        }
    }
}
//get
-(UIImage *)icon1
{
    UIImage *image = nil;
    //同步代码块
    @synchronized (self) {
        
        image = [[_icon1 retain] autorelease];
    }
    return image;
}
@end
