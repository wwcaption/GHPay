//
//  GHPayTableViewCell.m
//  GHPay-demo
//
//  Created by shen_gh on 16/3/15.
//  Copyright © 2016年 com.joinup(Beijing). All rights reserved.
//

#import "GHPayTableViewCell.h"

@interface GHPayTableViewCell()

@property (nonatomic,strong) UIImageView *accessoryImageView;
@end

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation GHPayTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self.contentView addSubview:self.accessoryImageView];
    }
    return self;
}
- (UIImageView *)accessoryImageView{
    if (!_accessoryImageView) {
        _accessoryImageView=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth-35.0, 30.0, 20.0, 20.0)];
        [_accessoryImageView setContentMode:UIViewContentModeCenter];
        [_accessoryImageView setImage:[UIImage imageNamed:@"accessory_normal"]];
    }
    return _accessoryImageView;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        [self.accessoryImageView setImage:[UIImage imageNamed:@"accessory_selected"]];
    }else{
        [self.accessoryImageView setImage:[UIImage imageNamed:@"accessory_normal"]];
    }

    // Configure the view for the selected state
}

@end
