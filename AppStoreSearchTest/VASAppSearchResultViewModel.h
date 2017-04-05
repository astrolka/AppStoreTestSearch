//
//  VASAppSearchResultViewModel.h
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "VASViewModelProtocol.h"

@class VASSearchResultModel;

@interface VASAppSearchResultViewModel : NSObject <VASViewModelProtocol>

@property(strong, nonatomic)NSString *name;
@property(strong, nonatomic)NSURL *imageUrl;
@property(strong, nonatomic)NSString *lastReleaseDate;
@property(strong, nonatomic)NSString *version;
@property(strong, nonatomic)NSString *price;
- (void)priceButtonClicked;

@end
