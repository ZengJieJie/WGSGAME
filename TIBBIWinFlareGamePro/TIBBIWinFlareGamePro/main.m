//
//  main.m
//  TIBBIWinFlareGamePro
//
//  Created by adin on 2024/8/21.
//

#import <UIKit/UIKit.h>
#import "TIBAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([TIBAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
