//
//  VASSearchResultsControllerViewModel.h
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "VASViewModelProtocol.h"

@class VASDynamicProperty, VASAppSearchResultViewModel;

@interface VASSearchResultsControllerViewModel : NSObject <VASViewModelProtocol>

@property(strong, nonatomic)VASDynamicProperty *cellsViewModels;
@property(strong, nonatomic)VASDynamicProperty *isExecuting;

- (VASAppSearchResultViewModel *)viewModelForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (void)performSearchWithText:(NSString *)text;

@end
