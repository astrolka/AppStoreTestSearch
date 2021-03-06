//
//  VASViewModelManager.h
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "VASServerManager.h"

@interface VASViewModelManager : NSObject

- (VASServerManager *)getServerManager;
- (void)navigateInAppStoreToAppWithId:(NSInteger)appId;

@end
