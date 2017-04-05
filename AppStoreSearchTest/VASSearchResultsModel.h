//
//  VASSearchResultsModel.h
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VASServerModelProtocol.h"

@class VASSearchResultModel;

@interface VASSearchResultsModel : NSObject <VASServerModelProtocol>

@property(assign, nonatomic)NSInteger resultCount;
@property(strong, nonatomic)NSArray <VASSearchResultModel *> *appModels;
@end
