//
//  BWHDrawView.m
//  TouchTracker
//
//  Created by Alex on 4/27/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWHDrawView.h"
#import "BWHLine.h"
#import <math.h>

@interface BWHDrawView ()

//@property (nonatomic, strong) BWHLine *currentLine;
@property (nonatomic, strong) NSMutableDictionary *lineInProgress;
@property (nonatomic, strong) NSMutableArray *finishedLines;
@property (nonatomic, strong) NSMutableDictionary *circleInProgress;
@property (nonatomic, strong) NSMutableArray *finishedCircles;

@end


@implementation BWHDrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.lineInProgress = [[NSMutableDictionary alloc] init];
        self.finishedLines = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
    }
    
    return self;
}

- (void)strokeLine:(BWHLine *)line
{
//    UIBezierPath *bp = [[UIBezierPath alloc] init];
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}

- (void)strokeCircle:(CGPoint)p1 point:(CGPoint)p2
{
    CGPoint midPoint;
    midPoint.x = (p1.x + p2.x) / 2;
    midPoint.y = (p1.y + p2.y) / 2;
    CGFloat radius = (sqrtf((p1.x-p2.x)*(p1.x-p2.x)+(p1.y-p2.y)*(p1.y-p2.y))) / 2.0;
    UIBezierPath *bp = [UIBezierPath bezierPathWithArcCenter:midPoint
                                                      radius:radius
                                                  startAngle:0.0
                                                    endAngle:M_PI_2
                                                   clockwise:YES];
    bp.lineWidth = 10;
    
}

- (void)drawRect:(CGRect)rect
{
    // Draw finished lines in black
//    [[UIColor blackColor] set];
    for (BWHLine *line in self.finishedLines) {
        [[line lineColor] set];
        [self strokeLine:line];
    }
    
    [[UIColor redColor] set];
    for (NSValue *key in self.lineInProgress) {
        [self strokeLine:self.lineInProgress[key]];
    }
    
    [[UIColor greenColor] set];
    if (self.circleInProgress) {
        NSArray *keys = [self.circleInProgress allKeys];
        CGPoint p1 = [self.circleInProgress[keys[0]] CGPointValue];
        CGPoint p2 = [self.circleInProgress[keys[1]] CGPointValue];
        [self strokeCircle:p1 point:p2];
    }
    
    
    
//    if (self.currentLine) {
//        // If there is a line currently being drawn, do it in red
//        [[UIColor redColor] set];
//        [self strokeLine:self.currentLine];
//    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Let's put in a log statement to see the order of events
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    if ([touches count] == 2) {
        
        for (UITouch *t in touches) {
            CGPoint location = [t locationInView:self];
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            self.circleInProgress[key] = [NSValue valueWithCGPoint:location];
        }
        
    } else {
        for (UITouch *t in touches) {
            CGPoint location = [t locationInView:self];
            
            BWHLine *line = [[BWHLine alloc] init];
            line.begin = location;
            line.end = location;
            
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            self.lineInProgress[key] = line;
            
        }
    }
    
    [self setNeedsDisplay];
    
//    UITouch *t = [touches anyObject];
//    
//    // Get location of the touch in view's coordinate system
//    CGPoint location = [t locationInView:self];
//    
//    self.currentLine = [[BWHLine alloc] init];
//    self.currentLine.begin = location;
//    self.currentLine.end = location;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//    UITouch *t = [touches anyObject];
//    CGPoint location= [t locationInView:self];
//    
//    self.currentLine.end = location;

    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    if ([touches count] == 2) {
        for (UITouch *t in touches) {
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            self.circleInProgress[key] = [NSValue valueWithCGPoint:[t locationInView:self]];
        }
    } else {
        for (UITouch *t in touches) {
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            BWHLine *line = self.lineInProgress[key];
            
            line.end = [t locationInView:self];
        }
    }
    
    [self setNeedsDisplay];
    
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [self.finishedLines addObject:self.currentLine];
//    
//    self.currentLine = nil;
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    if ([touches count] == 2) {
        for (UITouch *t in touches) {
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            [self.finishedCircles addObject:self.circleInProgress[key]];
            [self.circleInProgress removeObjectForKey:key];
        }
        
    } else {
        for (UITouch *t in touches) {
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            BWHLine *line = self.lineInProgress[key];
            
            [self.finishedLines addObject:line];
            [self.lineInProgress removeObjectForKey:key];
        }
    }
    [self setNeedsDisplay];
}


- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    if ([touches count] == 2) {
        for (UITouch *t in touches) {
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            [self.circleInProgress removeObjectForKey:key];
        }
        
    } else {
        for (UITouch *t in touches) {
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            [self.lineInProgress removeObjectForKey:key];
        }
    }
    [self setNeedsDisplay];
}





@end
