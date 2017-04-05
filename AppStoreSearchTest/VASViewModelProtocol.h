//
//  VASViewModelProtocol.h
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VASViewModelManager;

@protocol VASViewModelProtocol <NSObject>

- (instancetype)initWithModel:(id)model andViewModelManager:(VASViewModelManager *)viewModelManager;

@end
