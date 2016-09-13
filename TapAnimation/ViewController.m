//
//  ViewController.m
//  TapAnimation
//
//  Created by Dennis on 12/9/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BFTapView *tapView1 = [[BFTapView alloc] initWithFrame:CGRectMake(100, 100, 100, 100) delegate:self];
    tapView1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:tapView1];
    
    BFTapView *tapView2 = [[BFTapView alloc] initWithFrame:CGRectMake(100, 250, 100, 100) delegate:self];
    tapView2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:tapView2];
    
    BFTapView *tapView3 = [[BFTapView alloc] initWithFrame:CGRectMake(100, 400, 100, 100) delegate:self];
    tapView3.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:tapView3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tapped
{
    NSLog(@"tapped!");
}

@end
