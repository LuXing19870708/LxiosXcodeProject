//
//  ViewController.m
//  LxiosXcodeProject
//
//  Created by David on 2017/3/31.
//  Copyright © 2017年 LUXING. All rights reserved.
//

#import "ViewController.h"
#import "LxKeychainUtils.h"


@interface ViewController ()
{

}

@end

@implementation ViewController


@synthesize firstBtn;
@synthesize secondBtn;


//called when all views are initialized and ready to be programed
- (void)viewDidLoad {
    [super viewDidLoad];
}


-(IBAction)btnClicked:(id)sender{

    if (sender == firstBtn) {
        NSLog(@"first btn clicked");
        
        //by default - group : TeamID.BundleID
        [LxKeychainUtils save:@"pkey" data:@"githubp"];
        
        [LxKeychainUtils save:@"cmkey" data:@"sharedatashit111" group:@"CRBCTALN3V.*"];
        
        
        
    }
    
    
    if (sender == secondBtn) {
        NSLog(@"second btn clicked");
        
        [LxKeychainUtils save:@"ctok" data:@"xdddjjtoeoeooentoken" group:@"CRBCTALN3V.rtsdktoken"];
        
        
    }
    
}



-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
