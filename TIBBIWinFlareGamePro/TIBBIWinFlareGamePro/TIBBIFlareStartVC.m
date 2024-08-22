//
//  ViewController.m
//  TIBBIWinFlareGamePro
//
//  Created by adin on 2024/8/21.
//

#import "TIBBIFlareStartVC.h"
#import "TIBAppDelegate.h"
#import "RootViewController.h"
#import "TIBBIWinFlareGamePro-Swift.h"
@interface TIBBIFlareStartVC ()

@end

@implementation TIBBIFlareStartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)TIBBIStartbenclick {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *homeNav = [storyboard instantiateViewControllerWithIdentifier:@"TIBBINavController"];
    RootViewController *rootVC = [(TIBAppDelegate *)UIApplication.sharedApplication.delegate viewController];
    homeNav.modalPresentationStyle = UIModalPresentationFullScreen;
    [rootVC presentViewController:homeNav animated:YES completion:nil];
}

@end
