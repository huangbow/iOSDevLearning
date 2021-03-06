//
//  BWHDetailViewController.h
//  Homepwner
//
//  Created by Bowen Huang on 4/17/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BWItem;

@interface BWHDetailViewController : UIViewController

- (instancetype)initForNewItem:(BOOL)isNew;

@property (nonatomic, strong) BWItem *item;
@property (nonatomic, copy) void (^dismissBlock)(void);


@end
