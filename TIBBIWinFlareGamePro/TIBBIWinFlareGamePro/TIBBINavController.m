//
//  TIBBINavController.m
//  TIBBIWinFlareGamePro
//
//  Created by TIBBIWinFlareGamePro on 2024/8/21.
//

#import "TIBBINavController.h"
#import "TIBBIAvoidCrash.h"

@interface TIBBINavController ()

@end

@implementation TIBBINavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSArray *noneSelClassStrings = @[
                              @"NSNull",
                              @"NSNumber",
                              @"NSString",
                              @"NSDictionary",
                              @"NSArray"
                              ];
    [TIBBIAvoidCrash setupNoneSelClassStringsArr:noneSelClassStrings];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
