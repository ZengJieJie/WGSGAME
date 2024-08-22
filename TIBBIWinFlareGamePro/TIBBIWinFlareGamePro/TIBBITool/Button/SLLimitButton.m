//
//  SLLimitButton.m
//  SangoLive
//
//  Created by 林剑波 on 2022/5/13.
//  Copyright © 2022 Sango. All rights reserved.
//

#import "SLLimitButton.h"

@interface SLLimitButton()
@property (nonatomic, assign) BOOL ignoreEvent;
@end

@implementation SLLimitButton
/*
+(void)load {
    //a方法有可能是在父类中实现的,要做容错
    Method a = class_getInstanceMethod(self,@selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self,@selector(swizzled_sendAction:to:forEvent:));
    BOOL didAddMethod = class_addMethod([self class],@selector(sendAction:to:forEvent:), method_getImplementation(b), method_getTypeEncoding(b));
    
    if (didAddMethod) {
        //a方法在父类中,要使用以下方法交换
        class_replaceMethod([self class], @selector(swizzled_sendAction:to:forEvent:), method_getImplementation(a), method_getTypeEncoding(a));
    }else{
        method_exchangeImplementations(a, b);
    }
}
*/

+ (void)initialize
{
//    [NSObject cg_swizzleInstanceMethod:self
//                                newSEL:@selector(swizzled_sendAction:to:forEvent:)
//                               origSEL:@selector(sendAction:to:forEvent:)
//                                revert:false];
}

- (void)swizzled_sendAction:(SEL)action to:(id)target forEvent:(UIEvent*)event {
    if (self.ignoreEvent) {
        NSLog(@"重复点击:%@",self);
        return;
    }
    if (self.limitEventInterval > 0) {
        self.ignoreEvent = YES;
        [self performSelector:@selector(setIgnoreEventWithNo)  withObject:nil afterDelay:self.limitEventInterval];
    }
    [self swizzled_sendAction:action to:target forEvent:event];
}

-(void)setIgnoreEventWithNo {
    self.ignoreEvent = NO;
}

@end
