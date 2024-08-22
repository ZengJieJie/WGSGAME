//
//  SLPasswordTextField.m
//  SangoLive
//
//  Created by 胡伟伟 on 2020/4/17.
//  Copyright © 2020 胡伟伟. All rights reserved.
//

#import "SLPasswordTextField.h"

@implementation SLPasswordTextField


-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return NO;

}
//- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
//{
//    if (action == @selector(paste:))
//        return NO;
//
//    if (action == @selector(select:))
//        return NO;
//
//    if (action == @selector(selectAll:))
//        return NO;
// 
//    return [super canPerformAction:action withSender:sender];
//
//}
@end
