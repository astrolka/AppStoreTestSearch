//
//  VASDynamicProperty.m
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "VASDynamicProperty.h"

@interface VASDynamicProperty ()

@property(copy, nonatomic)Listener listener;

@end

@implementation VASDynamicProperty

- (instancetype)initWithValue:(id)value
{
    self = [super init];
    if (self) {
        _value = value;
    }
    return self;
}

- (void)setValue:(id)value {
    _value = value;
    _listener(value);
}

- (void)bindListener:(Listener)listener {
    _listener = listener;
}

- (void)bindAndFireListener:(Listener)listener {
    _listener = listener;
    _listener(self.value);
}

@end
