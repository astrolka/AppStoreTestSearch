//
//  VASViewModelManager.m
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "VASViewModelManager.h"
#import <UIKit/UIKit.h>

@implementation VASViewModelManager

- (VASServerManager *)getServerManager {
    return [VASServerManager sharedManager];
}

- (void)navigateInAppStoreToAppWithId:(NSInteger)appId {
    NSString *stringUrl = [@"itms-apps://itunes.apple.com/app/id" stringByAppendingFormat:@"%ld", appId];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:stringUrl] options:@{} completionHandler:nil];
}

@end
