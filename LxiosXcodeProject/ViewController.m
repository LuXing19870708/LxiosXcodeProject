//
//  ViewController.m
//  LxiosXcodeProject
//
//  Created by LUXING on 2017/3/31.
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
