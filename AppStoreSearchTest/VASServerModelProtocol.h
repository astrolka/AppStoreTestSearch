//
//  VASServerModelProtocol.h
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VASServerModelProtocol <NSObject>
- (instancetype)initWithSerializedJSON:(NSDictionary *)json;
@end
