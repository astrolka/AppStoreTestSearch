//
//  UIImageView+VASLoadImage.m
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "UIImageView+VASLoadImage.h"
#import "VASServerManager.h"

@implementation UIImageView (VASLoadImage)

+ (NSCache *)sharedImageCache {
    static NSCache *imageCache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imageCache = [[NSCache alloc] init];
    });
    return imageCache;
}

- (void)loadImageWithUrl:(NSURL *)url {
    
    NSCache *imageCache = [UIImageView sharedImageCache];
    
    UIImage *cachedImage = [imageCache objectForKey:url];
    if (cachedImage) {
        self.image = cachedImage;
        return;
    }
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url
                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                    if (error) {
                                        NSLog(@"%@", error.localizedDescription);
                                        return;
                                    }
                                    
                                    UIImage *image = [UIImage imageWithData:data];
                                    [imageCache setObject:image forKey:url];
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        self.image = image;
                                    });
                                }] resume];
    
}

@end
