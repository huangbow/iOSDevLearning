//
//  BWHLine.h
//  TouchTracker
//
//  Created by Alex on 4/27/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BWHLine :UIView

@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint end;


- (UIColor *)lineColor;

@end
