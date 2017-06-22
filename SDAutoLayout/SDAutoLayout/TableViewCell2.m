//
//  TableViewCell2.m
//  SDAutoLayout
//
//  Created by etmedia on 2017/6/20.
//  Copyright © 2017年 etmedia. All rights reserved.
//

#import "TableViewCell2.h"
#import <UIView+SDAutoLayout.h>
#import <UITableView+SDAutoTableViewCellHeight.h>

@implementation TableViewCell2
{
    UILabel * contentLab;
    UILabel * commentLab;
    UIImageView * picIMG;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUp];
    }
    return self;
}

-(void)setUp
{
    contentLab = [UILabel new];
    contentLab.backgroundColor = [UIColor lightGrayColor];

    commentLab = [UILabel new];
    commentLab.backgroundColor = [UIColor greenColor];
    
    picIMG = [UIImageView new];
    picIMG.backgroundColor = [UIColor yellowColor];

    [self.contentView addSubview:contentLab];
    [self.contentView addSubview:commentLab];
    [self.contentView addSubview:picIMG];
    
    contentLab.sd_layout
    .leftSpaceToView(self.contentView, 32)
    .topSpaceToView(self.contentView, 16)
    .rightSpaceToView(self.contentView, 32)
    .autoHeightRatio(0);
    
    commentLab.sd_layout
    .leftEqualToView(contentLab)
    .rightSpaceToView(self.contentView, 32)
    .topSpaceToView(contentLab, 16)
    .autoHeightRatio(0);
    
    picIMG.sd_layout
    .topSpaceToView(commentLab, 18)
    .widthRatioToView(contentLab, 0.7)
    .centerXEqualToView(self.contentView);

}

-(void)setModel:(Model2 *)model
{
    contentLab.text = model.content;

    commentLab.text = model.comment;
    
    UIImage * image = [UIImage imageNamed:model.picName];
    
    CGFloat bottomM = 0;
    
    if (image.size.width > 0) {
        
        picIMG.image = image;
        
        CGFloat scale = image.size.height/image.size.width;
        
        picIMG.sd_layout.autoHeightRatio(scale);
        
        bottomM = 16;
    
    }else{
        
        picIMG.sd_layout.autoWidthRatio(0);
    
    }
    
    [self setupAutoHeightWithBottomView:picIMG bottomMargin:bottomM];
}

@end
