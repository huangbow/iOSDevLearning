//
//  BWHImageStore.m
//  Homepwner
//
//  Created by Bowen Huang on 4/18/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWHImageStore.h"

@interface BWHImageStore ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end


@implementation BWHImageStore


+ (instancetype)sharedStore
{
    static BWHImageStore *sharedStore;
    
//    if (!sharedStore) {
//        sharedStore = [[self alloc] initPrivate];
//    }
    
    // Thread-safe
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    
    return sharedStore;
}

// No one should call init
- (instancetype)init
{
    [NSException raise:@"Singleton" format:@"Use +[BWHImageStore sharedStore]"];
    
    return nil;
}

//  secret designed initializer
- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}


- (void)setImage:(UIImage *)image forkey:(NSString *)key
{
//    [self.dictionary setObject:image forKey:key];
    self.dictionary[key] = image;
}


- (UIImage *)imageForKey:(NSString *)key
{
//    return [self.dictionary objectForKey:key];
    return self.dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
    
}


@end
