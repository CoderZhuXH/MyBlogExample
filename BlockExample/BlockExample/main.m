//
//  main.m
//  BlockExample
//
//  Created by zhuxiaohui on 2017/5/10.
//  Copyright © 2017年 zhuxiaohui. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
      __block  int a = 10;
        
        void(^block)() = ^{

            printf("%d\n",a);

        };
        
        a = 20;
        block();

    }
    return 0;
}
