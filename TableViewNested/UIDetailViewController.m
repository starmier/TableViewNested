//
//  UIDetailViewController.m
//  TableViewNested
//
//  Created by gdcn on 15-3-4.
//  Copyright (c) 2015年 cndatacom. All rights reserved.
//

#import "UIDetailViewController.h"

@interface UIDetailViewController (){
    NSString *_titleStr;
}

@end

@implementation UIDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithData:(id)data
{
    self = [self init];
    if (self) {
        _titleStr = data;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIApplication sharedApplication]setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    

    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat yPoint = 0.0f;
    CGRect rect = [UIScreen mainScreen].bounds;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
        yPoint += 20.0f;
        UIView *headV = [[UIView alloc]init];
        headV.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
        
        [headV setBackgroundColor:[UIColor redColor]];
        [self.view addSubview:headV];
    }else{
        UIView *headV = [[UIView alloc]init];
        headV.frame = CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 20);
        //        [headV setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"gg2.png"]]];
        [headV setBackgroundColor:[UIColor redColor]];
        [self.view addSubview:headV];
    }
    rect.size.height -= 20;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, yPoint, 80, 40);
    [btn setTitle:@"back" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UILabel *toast = [[UILabel alloc]initWithFrame:CGRectMake((rect.size.width - 200)/2, (rect.size.height - 30)/2, 200, 30)];
    toast.backgroundColor = [UIColor clearColor];
    toast.text = _titleStr;
    toast.font = [UIFont boldSystemFontOfSize:18];
    toast.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:toast];
}

-(void)onBack:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
