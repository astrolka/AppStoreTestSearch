//
//  VASServerManager.m
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "VASServerManager.h"
#import "VASSearchResultsModel.h"
#import <UIKit/UIKit.h>

@implementation VASServerManager {
    NSMutableSet *tasks;
    NSURLSession *defaultSession;
    NSURLSessionDataTask *dataTask;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        tasks = [NSMutableSet set];
        defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return self;
}

+ (instancetype)sharedManager {
    static VASServerManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[VASServerManager alloc] init];
    });
    return manager;
}

- (void) appSearchWithSearchText:(NSString *)searchText successHandler:(void(^)(VASSearchResultsModel *))success andErrorHandler:(void(^)(NSError *))faild {
    if (!dataTask) {
        [dataTask cancel];
    }
    dataTask = [defaultSession dataTaskWithURL:[self urlWithSearchText:searchText]
                             completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                 if (error) {
                                     
                                 } else if ([response isKindOfClass:[NSHTTPURLResponse class]] && ((NSHTTPURLResponse *)response).statusCode == 200) {
                                     NSError *error;
                                     NSDictionary *serializedJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                                     if (error) {
                                         faild(error);
                                     }
                                     success([[VASSearchResultsModel alloc] initWithSerializedJSON:serializedJSON]);
                                 } else {
                                     faild(nil);
                                 }
                             }];
    [dataTask resume];
}

- (NSURL *)urlWithSearchText:(NSString *)text {
    NSString *baseStringUrl = @"https://itunes.apple.com/search?media=software&term=";
    NSString *searchTerm = [text stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString *stringUrl = [baseStringUrl stringByAppendingString:searchTerm];
    return [NSURL URLWithString:stringUrl];
}



@end
