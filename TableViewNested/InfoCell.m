//
//  InfoCell.m
//  TableViewNested
//
//  Created by gdcn on 15-3-4.
//  Copyright (c) 2015年 cndatacom. All rights reserved.
//

#import "InfoCell.h"


@interface InfoCell ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSMutableArray *_dataSource;
    UITableView *tableview;
}


@end

@implementation InfoCell

@synthesize infoDelegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _dataSource = [[NSMutableArray alloc]initWithCapacity:0];
        
        tableview = [[UITableView alloc]initWithFrame:CGRectMake( 90, -90, 140, 280) style:UITableViewStylePlain];
        tableview.delegate = self;
        tableview.dataSource = self;
        tableview.transform = CGAffineTransformMakeRotation(M_PI/2*3);//这里是将table旋转270度，如果是90度的话，相当于整个横向的UITableView也旋转了。
        tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableview.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:tableview];
    }
    return self;
}




-(void)setdata:(id)newValue
{
    if(_dataSource != newValue)
    {
        _dataSource = nil;
        
        _dataSource = [newValue copy];
        
    }
    
    [tableview reloadData];
    
}

#pragma mark -- tableviewDelegate method
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1 ;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    switch (indexPath.row) {
        case 0:{
            static NSString *cellname= @"cell0";
            cell = [tableView dequeueReusableCellWithIdentifier:cellname];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
            }
            cell.transform = CGAffineTransformMakeRotation(M_PI/2);//将cell中得文字旋转90度
            cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
            break;
        case 1:{
            static NSString *cellname= @"cell1";
            cell = [tableView dequeueReusableCellWithIdentifier:cellname];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
            }
            cell.transform = CGAffineTransformMakeRotation(M_PI/2);//将cell中得文字旋转90度
            cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
            break;
        case 2:{
            static NSString *cellname= @"cell2";
            cell = [tableView dequeueReusableCellWithIdentifier:cellname];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
            }
            cell.transform = CGAffineTransformMakeRotation(M_PI/2);//将cell中得文字旋转90度
            cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
            break;
        case 3:{
            static NSString *cellname= @"cell3";
            cell = [tableView dequeueReusableCellWithIdentifier:cellname];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
            }
            cell.transform = CGAffineTransformMakeRotation(M_PI/2);//将cell中得文字旋转90度
            cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
            break;
        case 4:{
            static NSString *cellname= @"cell4";
            cell = [tableView dequeueReusableCellWithIdentifier:cellname];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
            }
            cell.transform = CGAffineTransformMakeRotation(M_PI/2);//将cell中得文字旋转90度
            cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
            break;
        case 5:{
            static NSString *cellname= @"cell5";
            cell = [tableView dequeueReusableCellWithIdentifier:cellname];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
            }
            cell.transform = CGAffineTransformMakeRotation(M_PI/2);//将cell中得文字旋转90度
            cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
            break;
        default:
            break;
    }

    
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self.infoDelegate onResultData:[_dataSource objectAtIndex:indexPath.row]];
    
    NSLog(@"%s:::%@",__func__,[_dataSource objectAtIndex:indexPath.row]);
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
