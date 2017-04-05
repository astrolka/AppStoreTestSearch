//
//  VASSearchResultCell.m
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "VASSearchResultCell.h"
#import "VASAppSearchResultViewModel.h"
#import "UIImageView+VASLoadImage.h"

@interface VASSearchResultCell ()

@property(weak, nonatomic)VASAppSearchResultViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UIImageView *appImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *priceButton;

@end

@implementation VASSearchResultCell

#pragma mark - Initialization

- (void)awakeFromNib {
    [super awakeFromNib];
    self.priceButton.layer.borderWidth = 1;
    self.priceButton.layer.borderColor = [UIColor redColor].CGColor;
    self.priceButton.layer.cornerRadius = 4;
}

- (void)bindViewModel:(id)viewModel {
    _viewModel = viewModel;
    
    self.appImageView.image = [UIImage imageNamed:@"placeholder"];
    [self.appImageView loadImageWithUrl:self.viewModel.imageUrl];
    self.titleLabel.text = self.viewModel.name;
    self.versionLabel.text = self.viewModel.version;
    self.dateLabel.text = self.viewModel.lastReleaseDate;
    [self.priceButton setTitle:self.viewModel.price forState:UIControlStateNormal];
}

#pragma mark - Actions

- (IBAction)priceButtonClicked:(UIButton *)sender {
    [self.viewModel priceButtonClicked];
}

@end
