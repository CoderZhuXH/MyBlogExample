//
//  MyScrollView.m
//  ScrollViewExample
//
//  Created by zhuxiaohui on 2017/5/31.
//  Copyright © 2017年 zhuxiaohui. All rights reserved.
//

#import "MyScrollView.h"

@interface MyScrollView()<UIGestureRecognizerDelegate>
@property(nonatomic,strong)UIView *horizontalScrollIndicator;
@property(nonatomic,strong)UIView *verticalScrollIndicator;
@end

@implementation MyScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self == nil) {
        return nil;
    }
    // 添加一个滑动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
    pan.delegate = self;
    [self addGestureRecognizer:pan];
    
    
    _horizontalScrollIndicator = [[UIView alloc] initWithFrame:CGRectMake(self.bounds.size.width-5, 0, 5, 50)];
    _horizontalScrollIndicator.backgroundColor = [UIColor redColor];
    [self addSubview:_horizontalScrollIndicator];
    
    return self;
}

- (void)panGesture:(UIPanGestureRecognizer *)gestureRecognizer{
    // 改变bounds
    CGPoint translation = [gestureRecognizer translationInView:self];
    CGRect bounds = self.bounds;
    
    CGFloat newBoundsOriginX = bounds.origin.x - translation.x;
    CGFloat minBoundsOriginX = 0.0;
    CGFloat maxBoundsOriginX = self.contentSize.width - bounds.size.width;
    bounds.origin.x = fmax(minBoundsOriginX, fmin(newBoundsOriginX, maxBoundsOriginX));
    
    CGFloat newBoundsOriginY = bounds.origin.y - translation.y;
    CGFloat minBoundsOriginY = 0.0;
    CGFloat maxBoundsOriginY = self.contentSize.height - bounds.size.height;
    bounds.origin.y = fmax(minBoundsOriginY, fmin(newBoundsOriginY, maxBoundsOriginY));
    
    self.bounds = bounds;
    [gestureRecognizer setTranslation:CGPointZero inView:self];
}

// 让UIScrollView遵守UIGestureRecognizerDelegate协议,实现这个方法,在这里方法里对添加的手势进行处理就可以解决冲突
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
