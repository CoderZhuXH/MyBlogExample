//
//  main.m
//  WeakExample
//
//  Created by zhuxiaohui on 2017/5/11.
//  Copyright © 2017年 zhuxiaohui. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSObject *objc = [[NSObject alloc] init];
        id  __weak weakObjc = objc;
        
        NSLog(@"____");
    }
    return 0;
}
