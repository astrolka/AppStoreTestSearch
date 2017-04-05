//
//  VASSearchResultModel.m
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "VASSearchResultModel.h"

@implementation VASSearchResultModel

- (instancetype)initWithSerializedJSON:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        _version = json[@"version"];
        _name = json[@"trackName"];
        _id = [json[@"trackId"] integerValue];
        _price = json[@"formattedPrice"];
        _lastReleaseDate = json[@"currentVersionReleaseDate"];
        _imageStringUrl = json[@"artworkUrl100"];
    }
    return self;
}

@end
