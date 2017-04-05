//
//  VASSearchResultsControllerViewModel.m
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VASSearchResultsControllerViewModel.h"
#import "VASViewModelManager.h"
#import "VASSearchResultsModel.h"
#import "VASAppSearchResultViewModel.h"
#import "VASDynamicProperty.h"

@interface VASSearchResultsControllerViewModel ()

@property(strong, nonatomic)VASViewModelManager *viewModelManager;
@property(assign, nonatomic)NSInteger cellsCount;

@end

@implementation VASSearchResultsControllerViewModel

- (instancetype)initWithModel:(id)model andViewModelManager:(VASViewModelManager *)viewModelManager
{
    self = [super init];
    if (self) {
        _viewModelManager   = viewModelManager;
        _cellsViewModels    = [[VASDynamicProperty alloc] init];
        _isExecuting        = [[VASDynamicProperty alloc] initWithValue:@NO];
    }
    return self;
}

- (void)performSearchWithText:(NSString *)text {
    if (text.length == 0) {
        return;
    }
    self.isExecuting.value = @YES;
    
    __weak typeof(self) weakSelf = self;
    [[self.viewModelManager getServerManager]
     appSearchWithSearchText:text
     successHandler:^(VASSearchResultsModel *model) {
         __strong typeof(weakSelf) strongSelf = weakSelf;
         
         strongSelf.isExecuting.value = @NO;
         
         strongSelf.cellsCount = model.resultCount;
         
         NSMutableArray *temp = [NSMutableArray array];
         for (VASSearchResultModel *cellModel in model.appModels) {
             [temp addObject:[[VASAppSearchResultViewModel alloc] initWithModel:cellModel andViewModelManager:strongSelf.viewModelManager]];
         }
         strongSelf.cellsViewModels.value = temp;
     }
     andErrorHandler:^(NSError *error) {
         __strong typeof(weakSelf) strongSelf = weakSelf;
         strongSelf.isExecuting.value = @NO;
         //here we could say view to show an alert but I don't have any time to play with this, sorry:)
     }];
}

- (VASAppSearchResultViewModel *)viewModelForIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section == 0 ? self.cellsViewModels.value[indexPath.row] : nil;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return self.cellsCount;
}

@end
