//
//  BWHHypnosisView.m
//  Hypnosister
//
//  Created by Alex on 4/11/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWHHypnosisView.h"

@interface BWHHypnosisView ()

@property (nonatomic, strong) UIColor *circleColor;

@end

@implementation BWHHypnosisView


-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor  = [UIColor lightGrayColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect bounds = self.bounds;
    
    //Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //The circle will be the largest that will fit in the view
//    float radius = MIN(bounds.size.width, bounds.size.height) / 2.0;
    float maxRadius = hypot(bounds.size.width, bounds.size.height);
    
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
//    [path addArcWithCenter:center
//                    radius:radius
//                startAngle:0.0
//                  endAngle:M_PI * 2.0
//                 clockwise:YES];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    
    //Configure line width to 10 points
    path.lineWidth = 10;
    
    //Configure the drawing color to ligth grey
//    [[UIColor lightGrayColor] setStroke];
    [self.circleColor setStroke];
    
    
    //Draw the line!
    [path stroke];
    
    
    
    /*
    // The code below are CH4 challenges response
    //
    //
     
     
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    
    UIBezierPath *mypath = [[UIBezierPath alloc] init];
    [mypath moveToPoint:CGPointMake(bounds.size.width/2, (bounds.size.height-350)/2)];
    [mypath addLineToPoint:CGPointMake((bounds.size.width-220)/2, (bounds.size.height-350)/2+350)];
    [mypath addLineToPoint:CGPointMake((bounds.size.width-220)/2+220, (bounds.size.height-350)/2+350)];
    [mypath addLineToPoint:CGPointMake(bounds.size.width/2, (bounds.size.height-350)/2)];
    [mypath addClip];
    
    
    //Set Gradients
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {1.0, 0.0, 0.0, 1.0,
        1.0, 1.0, 0.0, 1.0};
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    
    CGPoint startPoint = {bounds.size.width/2, (bounds.size.height-350)/2};
    CGPoint endPoint = {bounds.size.width/2,(bounds.size.height-350)/2+350};
    
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    CGContextRestoreGState(currentContext);
    
    
    //Set Shadows
    
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    
    //Draw stuff here. It will appear with a shadow
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGRect smallRect = CGRectMake((bounds.size.width-220) / 2, (bounds.size.height-350) / 2, 220, 350);
    [logoImage drawInRect:smallRect];
    
    CGContextRestoreGState(currentContext);
    
    //Draw stuff here. It will not appear with a shadow
    
    */
    
    
}

//When finger touches the screen
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    
    //Get 3 random numbers between 0 and 1
    float red = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    self.circleColor = randomColor;
    
}

- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


@end
