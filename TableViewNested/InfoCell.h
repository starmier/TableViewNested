//
//  InfoCell.h
//  TableViewNested
//
//  Created by gdcn on 15-3-4.
//  Copyright (c) 2015年 cndatacom. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InfoCellDelegate <NSObject>

-(void)onResultData:(id)data;

@end

@interface InfoCell : UITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withData:(NSMutableArray *)data;

@property (nonatomic,assign) id<InfoCellDelegate>infoDelegate;

-(void)setdata:(id)newValue;

@end
