//
//  BWHImageStore.h
//  Homepwner
//
//  Created by Bowen Huang on 4/18/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BWHImageStore : NSObject

+ (instancetype)sharedStore;

- (void)setImage:(UIImage *)image forkey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;

@end
