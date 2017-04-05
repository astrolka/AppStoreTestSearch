//
//  VASSearchResultModel.h
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VASServerModelProtocol.h"

@interface VASSearchResultModel : NSObject <VASServerModelProtocol>

@property(strong, nonatomic)NSString *name;
@property(strong, nonatomic)NSString *imageStringUrl;
@property(strong, nonatomic)NSString *lastReleaseDate;
@property(strong, nonatomic)NSString *version;
@property(strong, nonatomic)NSString *price;
@property(assign, nonatomic)NSInteger id;

@end
