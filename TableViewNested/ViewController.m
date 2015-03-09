//
//  ViewController.m
//  TableViewNested
//
//  Created by gdcn on 15-3-4.
//  Copyright (c) 2015年 cndatacom. All rights reserved.
//

#import "ViewController.h"
#import "InfoCell.h"
#import "UIDetailViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,InfoCellDelegate>{
    NSMutableArray *_keyArr;
    NSMutableDictionary *_mutDict;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIApplication sharedApplication]setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
    [self creatDataSource];
    [self initsViews];
}

-(void)initsViews{
    CGFloat yPoint = 0.0f;
    CGRect rect = [UIScreen mainScreen].bounds;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
        yPoint += 20.0f;
        UIView *headV = [[UIView alloc]init];
        headV.frame = CGRectMake(0, 0, self.view.frame.size.width, 20);
//        [headV setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"gg2.png"]]];
        [headV setBackgroundColor:[UIColor redColor]];
        [self.view addSubview:headV];
        
    }else{
        UIView *headV = [[UIView alloc]init];
        headV.frame = CGRectMake(0, -20, self.view.frame.size.width, 20);
//        [headV setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"gg2.png"]]];
        [headV setBackgroundColor:[UIColor redColor]];
        [self.view addSubview:headV];
    }
    
    
    rect.size.height -= 20;
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, yPoint, rect.size.width, rect.size.height) style:UITableViewStyleGrouped];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
}

-(void)creatDataSource{
    _keyArr = [[NSMutableArray alloc]initWithCapacity:0];
    _mutDict = [[NSMutableDictionary alloc]initWithCapacity:0];

    for (NSInteger i = 0; i < 5; i++) {
    
        NSString *key = [NSString stringWithFormat:@"row%d",i];
        NSMutableArray *values = [[NSMutableArray alloc]initWithCapacity:0];
        for (NSInteger j = 0; j<=i; j++) {
            NSString *value = [NSString stringWithFormat:@"%@-value%d",key,j];
            [values addObject:value];
        }
        [_mutDict setObject:values forKey:key];
        [_keyArr addObject:key];
    }
}


#pragma mark -- tableviewDelegate method
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _keyArr.count ;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellname= @"cell";
    InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellname];
    if (!cell) {
        NSString *key = [_keyArr objectAtIndex:indexPath.section];
        NSMutableArray *data = [_mutDict objectForKey:key];
        cell = [[InfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
        [cell setdata:data];
        cell.infoDelegate = self;
    }else{//注意：ios7新属性，tableview 一次只生成一屏的cell，上下滑动过程中，若要复用之前的cell，则cell需要重新赋值，修改获取到的可以复用的cell中的值
        NSString *key = [_keyArr objectAtIndex:indexPath.section];
        NSMutableArray *data = [_mutDict objectForKey:key];
        [cell setdata:data]; 
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor =[UIColor whiteColor];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_keyArr objectAtIndex:section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
// 
//    UIView *headV = [[UIView alloc]init
//    ];
//    headV.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
//    [headV setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"gg2.png"]]];
//    UILabel *title = [[UILabel alloc]initWithFrame:headV.frame];
//    title.backgroundColor = [UIColor clearColor];
//    title.text = [_keyArr objectAtIndex:section];
//    title.font = [UIFont boldSystemFontOfSize:20];
//    title.textAlignment = NSTextAlignmentCenter;
//    [headV addSubview:title];
//    return headV;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIDetailViewController *detail = [[UIDetailViewController alloc]initWithData:[_keyArr objectAtIndex:indexPath.section]];
    detail.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:detail animated:YES completion:nil];
    
    NSLog(@"%s:::%@",__func__,[_keyArr objectAtIndex:indexPath.section]);

}

#pragma mark -- infoDelegate
-(void)onResultData:(id)data{
    
    UIDetailViewController *detail = [[UIDetailViewController alloc]initWithData:data];
    [self presentViewController:detail animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
