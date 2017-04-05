//
//  VASSearchResultsModel.m
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "VASSearchResultsModel.h"
#import "VASSearchResultModel.h"


@implementation VASSearchResultsModel

- (instancetype)initWithSerializedJSON:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        _resultCount = [json[@"resultCount"] integerValue];
        
        NSMutableArray *appModels = [NSMutableArray array];
        NSArray *appDictionaries = json[@"results"];
        for (NSDictionary *appDictionary in appDictionaries) {
            [appModels addObject:[[VASSearchResultModel alloc] initWithSerializedJSON:appDictionary]];
        }
        
        _appModels = appModels;
    }
    return self;
}

@end
