//
//  BWHDateChangeViewController.h
//  Homepwner
//
//  Created by Bowen Huang on 4/18/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BWItem;

@interface BWHDateChangeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, strong) BWItem *item;
@end
