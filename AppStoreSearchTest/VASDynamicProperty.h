//
//  VASDynamicProperty.h
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Listener) (id);

@interface VASDynamicProperty : NSObject

@property(strong, nonatomic)id value;

- (instancetype)initWithValue:(id)value;
- (void)bindAndFireListener:(Listener)listener;
- (void)bindListener:(Listener)listener;

@end
