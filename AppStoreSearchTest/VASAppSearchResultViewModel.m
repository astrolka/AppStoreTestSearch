//
//  VASAppSearchResultViewModel.m
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "VASAppSearchResultViewModel.h"
#import "VASSearchResultModel.h"
#import "VASViewModelManager.h"

@interface VASAppSearchResultViewModel ()

@property(strong, nonatomic)VASSearchResultModel *model;
@property(weak, nonatomic)VASViewModelManager *viewModelManager;

@end

@implementation VASAppSearchResultViewModel

- (instancetype)initWithModel:(VASSearchResultModel *)model andViewModelManager:(VASViewModelManager *)viewModelManager
{
    self = [super init];
    if (self) {
        _model = model;
        _viewModelManager = viewModelManager;
        [self initialize];
    }
    return self;
}

- (void) initialize {
    self.imageUrl = [NSURL URLWithString:self.model.imageStringUrl];
    self.name = self.model.name;
    self.version = self.model.version;
    self.price = self.model.price;
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *date = [dateFormater dateFromString:self.model.lastReleaseDate];
    [dateFormater setDateFormat:@"d MMM yy"];
    self.lastReleaseDate = [dateFormater stringFromDate:date];
}

- (void)priceButtonClicked {
    [self.viewModelManager navigateInAppStoreToAppWithId:self.model.id];
}

@end
