//
//  VASServerManager.h
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VASSearchResultsModel;

@interface VASServerManager : NSObject
+ (instancetype)sharedManager;
+ (NSCache *)sharedImageCache;
- (void) appSearchWithSearchText:(NSString *)searchText successHandler:(void(^)(VASSearchResultsModel *))success andErrorHandler:(void(^)(NSError *))faild;
@end
