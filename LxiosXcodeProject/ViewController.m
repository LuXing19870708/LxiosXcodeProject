//
//  ViewController.m
//  LxiosXcodeProject
//
//  Created by David on 2017/3/31.
//  Copyright © 2017年 LUXING. All rights reserved.
//

#import "ViewController.h"

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
    }
    
    
    if (sender == secondBtn) {
        NSLog(@"second btn clicked");
    }
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
