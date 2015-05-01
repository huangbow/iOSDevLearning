//
//  BWHLine.m
//  TouchTracker
//
//  Created by Alex on 4/27/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWHLine.h"
#import <math.h>

#define MAX_SCALE 1.0
#define MIN_SCALE 0.0

@implementation BWHLine




- (UIColor *)lineColor
{
    // Get Float of Coordinate differences
    CGFloat xDim = self.begin.x - self.end.x;
    CGFloat yDim = self.begin.y - self.end.y;
    
    // Get angel by using atan2f
    CGFloat angle=atan2f(xDim, yDim);
    
    //Get a value from 0-1 from the angle in radians
    CGFloat cValue=(angle+M_PI)/(M_PI*2);
    
    //Set the hue value of the line colour
    UIColor *color=[UIColor colorWithHue:cValue saturation:1.0 brightness:1.0 alpha:1.0];
    
    return color;
}

@end
