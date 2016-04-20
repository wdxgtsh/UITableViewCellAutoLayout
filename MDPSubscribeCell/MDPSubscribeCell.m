//
//  MDPSubscribeCell.m
//  MDPSubscribeCell
//
//  Created by wdxgtsh on 16/4/20.
//  Copyright © 2016年 wdxgtsh. All rights reserved.
//

#import "MDPSubscribeCell.h"
#import "Masonry.h"

#define PHONE_WIDTH [UIScreen mainScreen].bounds.size.width

@interface MDPSubscribeCell()

@property (nonatomic, strong) UIView * tagView;

@property (nonatomic, strong) UIView * dataView;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * contentLabel;

@property (nonatomic, strong) UIImageView * picImageView;

@property (nonatomic, strong) UIControl * collectionControl;

@property (nonatomic, assign) BOOL has;

@end

@implementation MDPSubscribeCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.tagView];
        [self.contentView addSubview:self.dataView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.picImageView];
        [self.contentView addSubview:self.collectionControl];
    }
    return self;
}


- (void)setModel:(MDPSubscribeModel *)model{
    _model = model;
    if (!_has) {
        [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.contentView);
            make.height.equalTo(@50);
        }];
        
        [self.dataView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.top.equalTo(self.tagView.mas_bottom).offset(10);
            make.width.equalTo(@50);
            make.height.equalTo(@30);
        }];
        
        [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.top.equalTo(self.tagView.mas_bottom).offset(50);
            make.width.equalTo(@0);
            make.height.equalTo(@0);
        }];
        
        [self.picImageView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [self.picImageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tagView.mas_bottom).offset(10 + 30 + 10);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.picImageView.mas_left).offset(-10);
        }];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
            make.left.right.equalTo(self.titleLabel);
        }];
        
        [self.collectionControl mas_makeConstraints:^(MASConstraintMaker *make) {
            [make.top.greaterThanOrEqualTo(self.picImageView.mas_bottom) priorityHigh];
            [make.top.greaterThanOrEqualTo(self.contentLabel.mas_bottom) priorityMedium];
            [make.top.greaterThanOrEqualTo(self.titleLabel.mas_bottom) priorityLow];
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.bottom.equalTo(self.contentView.mas_bottom);
            make.width.equalTo(@50);
            make.height.equalTo(@30);
        }];
        _has = YES;
    }
    
    // 有tag  或者  日期
    if (model.hasTag) {
        [self.tagView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@50);
        }];
        
        [self.dataView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0);
        }];
        
        [self.picImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tagView.mas_bottom).offset(10);
        }];
        
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tagView.mas_bottom).offset(10);
        }];
    }else{
        [self.tagView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0);
        }];
        
        [self.dataView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@30);
        }];
        
        [self.picImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tagView.mas_bottom).offset(10 + 30 + 10);
        }];
        
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tagView.mas_bottom).offset(10 + 30 + 10);
        }];
    }
    
    // 图片
    if (model.type == 2) {
        [self.picImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@105);
            make.height.equalTo(@70);
        }];
        
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.picImageView.mas_left).offset(-10);
        }];

        
        
        self.titleLabel.preferredMaxLayoutWidth = self.contentLabel.preferredMaxLayoutWidth = PHONE_WIDTH - 20 - 20 - 10 - 105;
        
    }else if (model.type == 1 && model.hasPic) {
        [self.picImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@90);
            make.height.equalTo(@90);
        }];
        
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.picImageView.mas_left).offset(-10);
        }];

        
        self.titleLabel.preferredMaxLayoutWidth = self.contentLabel.preferredMaxLayoutWidth = PHONE_WIDTH - 20 - 20 - 10 - 90;
    }else{
        [self.picImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@0);
            make.height.equalTo(@0);
        }];
        
        
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.picImageView.mas_left).offset(0);
        }];

        
        self.titleLabel.preferredMaxLayoutWidth = self.contentLabel.preferredMaxLayoutWidth = PHONE_WIDTH - 20 - 20;
    }
    
    // title content
    if (model.title.length == 0 || [model.title isEqualToString:@""]) {
        [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom);
        }];
    }else{
        [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        }];
    }
    
    self.titleLabel.text = model.title;
    self.contentLabel.text = model.content;
    
    for (UIView * view in [self.contentView subviews]) {
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
}


#pragma mark |---- lazy laod

- (UIView *)tagView{
    if (!_tagView) {
        _tagView = [[UIView alloc] init];
        _tagView.backgroundColor = [UIColor redColor];
    }
    return _tagView;
}

- (UIView *)dataView{
    if (!_dataView) {
        _dataView = [[UIView alloc] init];
        _dataView.backgroundColor = [UIColor purpleColor];
    }
    return _dataView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor redColor];
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.backgroundColor = [UIColor purpleColor];
        _contentLabel.numberOfLines = 2;
    }
    return _contentLabel;
}


- (UIImageView *)picImageView{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.backgroundColor = [UIColor purpleColor];
    }
    return _picImageView;
}

- (UIControl *)collectionControl{
    if (!_collectionControl) {
        _collectionControl = [[UIControl alloc] init];
        _collectionControl.backgroundColor = [UIColor blackColor];
    }
    return _collectionControl;
}


@end
