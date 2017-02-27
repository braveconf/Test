//
//  SelectedViewController.m
//  Cosme
//
//  Created by peijingwu on 17/1/8.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "SelectedViewController.h"
#import "BaseModel.h"

#define kSelectedbbsThreadCell @"SelectedbbsThreadCell"
#define kAdHeight ceilf(kScreenWidth / 375 * 225)

@interface SelectedDataModel : BaseModel

//cover, head
@property (nonatomic) NSString *cover;
@property (nonatomic) NSString *redirect_schema;

//user, second
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *tag_name1;
@property (nonatomic) NSString *tag_name2;
@property (nonatomic) NSString *tag_name3;
@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *avatar;
@property (nonatomic) NSString *opt_count;
@property (nonatomic) NSString *post_count;
@property (nonatomic) NSString *view_count;

//product, last
@property (nonatomic) NSString *product_name;
@property (nonatomic) NSString *stars;
@property (nonatomic) NSString *score;
@property (nonatomic) NSString *price;
@property (nonatomic) NSString *image_url;

@end

@implementation SelectedDataModel


@end

@interface SelectedCell : BaseTableCell

@property (nonatomic) UIImageView *coverImgView;
@property (nonatomic) UIImageView *avatarImgView;
@property (nonatomic) UIImageView *smallProductImgView;

@property (nonatomic) UILabel *titleName;
@property (nonatomic) UILabel *userName;

@property (nonatomic) UILabel *productName;

@property (nonatomic) UILabel *staticLabel1;
@property (nonatomic) UIImageView *staticImgV;


@property (nonatomic) UIView *sepV;
//
@property (nonatomic) UILabel *tag1;
@property (nonatomic) UILabel *tag2;
@property (nonatomic) UILabel *tag3;

@end

@implementation SelectedCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kAdHeight + 10)];
        headerV.backgroundColor = kSubColor3;

        _coverImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, kScreenWidth, kAdHeight)];
        [headerV addSubview:self.coverImgView];

        [self.contentView addSubview:headerV];

        UIView *middleV = [[UIView alloc] initWithFrame:CGRectMake(0, headerV.bottom, kScreenWidth, 95)];

        _avatarImgView = [[UIImageView alloc] initWithFrame:CGRectMake(kMargin, kMargin, 40, 40)];
        self.avatarImgView.layer.cornerRadius = self.avatarImgView.width / 2;
        _avatarImgView.clipsToBounds = YES;
        _titleName = [Utility createLabel:14 color:kMainColor1];
        _userName = [Utility createLabel:14 color:kSubColor1];

        _sepV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [Utility singleLineWidth], 12)];
        _sepV.backgroundColor = kSubColor3;

        _tag1 = [Utility createLabel:12 color:kMainColor];
        _tag2 = [Utility createLabel:12 color:kMainColor];
        _tag3 = [Utility createLabel:12 color:kMainColor];

        _staticLabel1 = [Utility createLabel:10 color:kSubColor1];
        self.staticLabel1.text = @"提到的产品";
        [self.staticLabel1 sizeToFit];
        self.staticLabel1.left = kMargin;
        self.staticLabel1.top = self.avatarImgView.bottom + 17;

        _staticImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kMargin, 0, kScreenWidth - kMargin, 1)];
        _staticImgV.backgroundColor = kSubColor3;
        _staticImgV.bottom = middleV.height;

        [middleV addSubview:self.titleName];
        [middleV addSubview:self.userName];
        [middleV addSubview:self.avatarImgView];
        [middleV addSubview:self.staticLabel1];
        [middleV addSubview:self.staticImgV];
        [middleV addSubview:self.sepV];
        [middleV addSubview:self.tag1];
        [middleV addSubview:self.tag2];
        [middleV addSubview:self.tag3];

        [self.contentView addSubview:middleV];

        UIView *lastV = [[UIView alloc] initWithFrame:CGRectMake(0, middleV.bottom, kScreenWidth, 95)];
        _productName = [Utility createLabel:12 color:kMainColor1];
        _smallProductImgView = [[UIImageView alloc] initWithFrame:CGRectMake(kMargin, 20, 62, 62)];
        self.smallProductImgView.contentMode = UIViewContentModeScaleAspectFit;
        [lastV addSubview:self.smallProductImgView];
        [lastV addSubview:self.productName];

        [self.contentView addSubview:lastV];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.titleName sizeToFit];
    [self.productName sizeToFit];
    [self.tag1 sizeToFit];
    [self.tag2 sizeToFit];
    [self.tag3 sizeToFit];

    [self.userName sizeToFit];
    self.titleName.top = 17;
    self.productName.top = 20;
    self.userName.left = self.titleName.left = 70;
    self.userName.top = self.titleName.bottom + 12;
    self.productName.left = 95;

    self.tag1.centerY = self.tag2.centerY = self.tag3.centerY = self.sepV.centerY = self.userName.centerY;
    self.sepV.left = self.userName.right + 15;

    self.tag1.left = self.sepV.right + 18;
    self.tag2.left = self.tag1.right + 18;
    self.tag3.left = self.tag2.right + 18;

}

- (void)setData:(id)data {
    [super setData:data];
    if ([data isKindOfClass:[SelectedDataModel class]]) {
        SelectedDataModel *d = (SelectedDataModel *)data;
        self.titleName.text = d.title;
        self.productName.text = d.product_name;

        self.tag1.text = d.tag_name1;
        self.tag2.text = d.tag_name2;
        self.tag3.text = d.tag_name3;

        self.staticLabel1.hidden = self.staticImgV.hidden = ![d.product_name length];

        [self.coverImgView getImageWithURL:d.cover placeholder:nil];
        [self.smallProductImgView getImageWithURL:d.image_url placeholder:nil];
        [self.avatarImgView getImageWithURL:d.avatar placeholder:nil];
        self.userName.text = d.userName;
        [self setNeedsLayout];
    }
}
@end

@interface SelectedViewController ()


@end

@implementation SelectedViewController

- (instancetype)init {
    if (self = [super init]) {
        self.title = @"精选";
    }
    return self;
}

@end
