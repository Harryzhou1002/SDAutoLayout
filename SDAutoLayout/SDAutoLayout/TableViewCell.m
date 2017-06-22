//
//  TableViewCell.m
//  SDAutoLayout
//
//  Created by etmedia on 2017/6/20.
//  Copyright © 2017年 etmedia. All rights reserved.
//

#import "TableViewCell.h"
#import <UIView+SDAutoLayout.h>
#import <UITableView+SDAutoTableViewCellHeight.h>

@implementation TableViewCell
{
    UIImageView * iconIMG;
    UILabel * nameLab;
    UILabel * contentLab;
    UIImageView * picIMG;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUp];
    }
    return self;
}

-(void)setUp{
    
    iconIMG = [[UIImageView alloc]init];
    iconIMG.backgroundColor = [UIColor yellowColor];

    nameLab = [[UILabel alloc]init];
    nameLab.backgroundColor = [UIColor lightGrayColor];
    
    contentLab = [[UILabel alloc]init];
    contentLab.backgroundColor = [UIColor greenColor];
    
    picIMG = [[UIImageView alloc]init];
    picIMG.backgroundColor = [UIColor blueColor];
    
    [self.contentView addSubview:iconIMG];
    [self.contentView addSubview:nameLab];
    [self.contentView addSubview:contentLab];
    [self.contentView addSubview:picIMG];
    
    iconIMG.sd_layout
    .leftSpaceToView(self.contentView, 16)
    .topSpaceToView(self.contentView, 16)
    .widthIs(40)
    .heightIs(40);
    
    nameLab.sd_layout
    .leftSpaceToView(iconIMG, 16)
    .topSpaceToView(self.contentView, 24)
    .widthIs(160)
    .heightIs(21);
    
    contentLab.sd_layout
    .leftEqualToView(nameLab)
    .topSpaceToView(nameLab, 16)
    .widthIs(160)
    .autoHeightRatio(0);
    
    picIMG.sd_layout
    .topSpaceToView(contentLab, 10)
    .leftEqualToView(contentLab)
    .widthRatioToView(contentLab, 0.7);

}

-(void)setModel:(Model *)model
{
    iconIMG.image = [UIImage imageNamed:model.iconStr];
    nameLab.text = [NSString stringWithFormat:@"%@",model.nameStr];
    contentLab.text = [NSString stringWithFormat:@"%@",model.contentStr];
     UIImage * image = [UIImage imageNamed:model.picStr];
    
    CGFloat bottomMargin  = 0;
    if (image.size.width > 0) {
        CGFloat scale = image.size.height/image.size.width;
        picIMG.sd_layout.autoHeightRatio(scale);
        bottomMargin = 10;
        picIMG.image = image;
    }else{
        picIMG.sd_layout.autoHeightRatio(0);
    }
    
    [self setupAutoHeightWithBottomView:picIMG bottomMargin:bottomMargin];
    
    
}


@end
