//
//  Person.m
//  LoadAndInitializeExample
//
//  Created by zhuxiaohui on 2017/5/4.
//  Copyright © 2017年 zhuxiaohui. All rights reserved.
//

#import "Person.h"

@implementation Person

+(void)load
{
    NSLog(@"%s",__FUNCTION__);
}


//+(void)initialize
//{
//    if(self==[Person class])
//    {
//        NSLog(@"%s",__FUNCTION__);
//    }
//}

+(void)initialize
{

    NSLog(@"%s",__FUNCTION__);

}

@end
