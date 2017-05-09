//
//  Person.m
//  AtomicAndNonatomicExample
//
//  Created by zhuxiaohui on 2017/5/9.
//  Copyright © 2017年 zhuxiaohui. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize name = _name;
@synthesize address = _address;

//Person.m 使用 mrc 环境

#pragma mark  nonatomic
//set
-(void)setName:(NSString *)name
{
    if(_name != name)
    {
        [_name release];
        [_name retain];
        _name = name;
    }
}

-(NSString *)name
{
   return _name;
}

#pragma mark - atomic
//set
-(void)setAddress:(NSString *)address
{
    @synchronized (self) {
        
        if(_address != address)
        {
            [_address release];
            _address = [address retain];
        }
    }
}
//get
-(NSString *)address
{
    NSString *result = nil;
    @synchronized (self) {
        
        result = [[_address retain] autorelease];
    }
    return result;
}
@end
