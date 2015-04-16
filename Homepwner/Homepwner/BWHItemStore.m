//
//  BWHItemStore.m
//  Homepwner
//
//  Created by Bowen Huang on 4/15/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWHItemStore.h"
#import "BWItem.h"

@interface BWHItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BWHItemStore

+(instancetype)sharedStore
{
    static BWHItemStore *sharedStore;
    
    //Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}



// If a programmer calls [[BWHItemStore alloc] init], let him
// know the error of his ways
-(instancetype)init
{
    [NSException raise:@"Singleton" format:@"Use +[BWHItemStore sharedStore]"];
    return nil;
}


// Here is the real (secret) initializer
-(instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

//getter
-(NSArray *)allItems
{
    return [self.privateItems copy];
}

-(BWItem *)createItem
{
    BWItem *item = [BWItem randomItem];
    [self.privateItems addObject:item];
    return item;
}


@end