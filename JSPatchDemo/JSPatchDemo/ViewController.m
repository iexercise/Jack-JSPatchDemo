//
//  ViewController.m
//  JSPatchDemo
//
//  Created by Jack_zz on 2017/2/28.
//  Copyright © 2017年 jack_zz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong)NSArray *testDataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.testDataArr = @[@"测试1",@"测试2",@"测试3",@"测试4",@"测试5",@"JSpatch"];
    
    //jsPatch
    [self jspatchTest];
}

- (void)jspatchTest{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
