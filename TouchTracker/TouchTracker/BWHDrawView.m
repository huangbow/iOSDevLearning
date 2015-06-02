//
//  BWHDrawView.m
//  TouchTracker
//
//  Created by Alex on 4/27/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWHDrawView.h"
#import "BWHLine.h"
#import "BWHCircle.h"
#import <math.h>

@interface BWHDrawView () <UIGestureRecognizerDelegate>

//@property (nonatomic, strong) BWHLine *currentLine;
@property (nonatomic, strong) NSMutableDictionary *lineInProgress;
@property (nonatomic, strong) NSMutableArray *finishedLines;
@property (nonatomic, strong) BWHCircle *circleInProgress;
@property (nonatomic, strong) NSMutableArray *finishedCircles;

@property (nonatomic, weak) BWHLine *selectedLine;

@property (nonatomic, strong) UIPanGestureRecognizer *moveRecognizer;
@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer;


@end


@implementation BWHDrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.lineInProgress = [[NSMutableDictionary alloc] init];
        self.finishedLines = [[NSMutableArray alloc] init];
        self.finishedCircles = [[NSMutableArray alloc] init];
        self.circleInProgress = [[BWHCircle alloc] init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
        
        UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
        doubleTapRecognizer.delaysTouchesBegan = YES;
        doubleTapRecognizer.numberOfTapsRequired = 2;
        
        [self addGestureRecognizer:doubleTapRecognizer];
        
        self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        self.tapRecognizer.delaysTouchesBegan = YES;
        [self.tapRecognizer requireGestureRecognizerToFail:doubleTapRecognizer];
        
        [self addGestureRecognizer:self.tapRecognizer];
        
        UILongPressGestureRecognizer *pressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        
        
        self.moveRecognizer.delaysTouchesBegan = YES;
        [self addGestureRecognizer:pressRecognizer];
        
        
        self.moveRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveLine:)];
        self.moveRecognizer.delegate = self;
        self.moveRecognizer.cancelsTouchesInView = NO;
        [self addGestureRecognizer:self.moveRecognizer];
        [self.moveRecognizer requireGestureRecognizerToFail:self.tapRecognizer];
        
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

- (void)strokeCircle:(BWHCircle *)circle
{
    UIBezierPath *bp = [UIBezierPath bezierPathWithArcCenter:circle.cen
                                                      radius:circle.radius
                                                  startAngle:0.0
                                                    endAngle:2*M_PI
                                                   clockwise:YES];
    bp.lineWidth = 5;
    [bp stroke];
    
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
    
    [[UIColor redColor] set];
    if (self.circleInProgress) {
        [self strokeCircle:self.circleInProgress];
    }
    
    [[UIColor greenColor] set];
    for (BWHCircle *c in self.finishedCircles) {
        [self strokeCircle:c];
    }
    
    if (self.selectedLine) {
        [[UIColor greenColor] set];
        [self strokeLine:self.selectedLine];
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
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (UITouch *t in touches) {
            [temp addObject:t];
        }
        CGPoint p1 = [temp[0] locationInView:self];
        CGPoint p2 = [temp[1] locationInView:self];
        BWHCircle *circle = [[BWHCircle alloc] init];
        circle.cen= CGPointMake((p1.x+p2.x)/2.0, (p1.y+p2.y)/2.0);
        circle.radius = (sqrtf((p1.x-p2.x)*(p1.x-p2.x)+(p1.y-p2.y)*(p1.y-p2.y))) / 2.0;
        self.circleInProgress = circle;
    } else {
        if (self.selectedLine) {
            self.selectedLine = nil;
            [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
            
        }
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
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (UITouch *t in touches) {
            [temp addObject:t];
        }
        CGPoint p1 = [temp[0] locationInView:self];
        CGPoint p2 = [temp[1] locationInView:self];
        BWHCircle *circle = [[BWHCircle alloc] init];
//        circle.circleCenter= CGPointMake((p1.x+p2.x)/2.0, (p1.y+p2.y)/2.0);
        circle.radius = (sqrtf((p1.x-p2.x)*(p1.x-p2.x)+(p1.y-p2.y)*(p1.y-p2.y))) / 2.0;
        self.circleInProgress.radius = circle.radius;
        
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
        BWHCircle *circle = self.circleInProgress;
        [self.finishedCircles addObject:circle];
        self.circleInProgress = nil;
        
        
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


- (BWHLine *)lineAtPoint:(CGPoint)p
{
    // Find a line close to p
    for (BWHLine *l in self.finishedLines) {
        CGPoint start = l.begin;
        CGPoint end = l.end;
        
        // Check a few points on the line
        for (float t = 0.0; t <= 1.0; t +=0.05) {
            float x = start.x+t*(end.x-start.x);
            float y = start.y+t*(end.y-start.y);
            
            
            // If the tapped point is within 20points,let's return this line
            if (hypot(x-p.x, y-p.y) < 20.0) {
                return l;
            }
        }
    }
    return nil;
}


- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    if ([touches count] == 2) {
        self.circleInProgress = nil;
        
    } else {
        for (UITouch *t in touches) {
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            [self.lineInProgress removeObjectForKey:key];
        }
    }
    [self setNeedsDisplay];
}

- (void)doubleTap:(UIGestureRecognizer *)gr
{
    NSLog(@"Recognized Double Tap");
    
    [self.lineInProgress removeAllObjects];
    [self.finishedLines removeAllObjects];
    [self setNeedsDisplay];
}

- (void)tap:(UIGestureRecognizer *)gr
{
    NSLog(@"Recognized tap");
    
    CGPoint point = [gr locationInView:self];
    self.selectedLine = [self lineAtPoint:point];
    
    
    if (self.selectedLine) {
        // Make ourselves the target of menu item action messages
        [self becomeFirstResponder];
        // Grab the menu controller
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        // Create a new "Delete" UIMenuItem
        UIMenuItem *deleteItem = [[UIMenuItem alloc] initWithTitle:@"Delete" action:@selector(deleteLine:)];
        
        menu.menuItems = @[deleteItem];
        
        // Tell the menu where it should come from and show it
        [menu setTargetRect:CGRectMake(point.x, point.y, 2, 2) inView:self];
        [menu setMenuVisible:YES animated:YES];
        
    } else {
        // Hide the menu if no line is selected
        [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
    }
    
    
    
    [self setNeedsDisplay];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}


- (void)deleteLine:(id)sender
{
    // Remove the selected line from the list of finishedLines
    [self.finishedLines removeObject:self.selectedLine];
    
    // Redraw everything
    [self setNeedsDisplay];
}

- (void)longPress:(UIGestureRecognizer *)gr
{
    if (gr.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [gr locationInView:self];
        self.selectedLine = [self lineAtPoint:point];
        
//        if (self.selectedLine) {
//            [self.lineInProgress removeAllObjects];
//        }
//        
    } else if (gr.state == UIGestureRecognizerStateEnded) {
        self.selectedLine = nil;
    }
    [self setNeedsDisplay];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (gestureRecognizer == self.moveRecognizer) {
        return YES;
    }
    return NO;
}


- (void)moveLine:(UIPanGestureRecognizer *)gr
{
    // If we have not selected a line, we do not do anything here
    if (!self.selectedLine) {
        return;
    }
    
    // When the pan recognizer changes its position...
    if (gr.state == UIGestureRecognizerStateChanged) {
        NSLog(@"Pan velocity in X:%f and Y:%f",[self.moveRecognizer velocityInView:self].x, [self.moveRecognizer velocityInView:self].y);
        // How far has the pan moved?
        CGPoint translation = [gr translationInView:self];
        
        // And the translation to the current beginning and end potints of the line
        CGPoint begin = self.selectedLine.begin;
        CGPoint end = self.selectedLine.end;
        begin.x += translation.x;
        begin.y += translation.y;
        end.x +=translation.x;
        end.y +=translation.y;
        
        
        // Set the new beginning and end points of the line
        self.selectedLine.begin = begin;
        self.selectedLine.end = end;
        
        // Redraw the screen
        [self setNeedsDisplay];
        
        [gr setTranslation:CGPointZero inView:self];
        
    }
}






@end
