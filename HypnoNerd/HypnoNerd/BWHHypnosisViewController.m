//
//  BWHHypnosisViewController.m
//  HypnoNerd
//
//  Created by Bowen Huang on 4/12/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWHHypnosisViewController.h"
#import "BWHHypnosisView.h"

@interface BWHHypnosisViewController () <UITextFieldDelegate>
@end

@implementation BWHHypnosisViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Hypnosize";
        self.tabBarItem.image = [UIImage imageNamed:@"Hypno.png"];
    }
    return self;
}


-(void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    BWHHypnosisView *backgroundView = [[BWHHypnosisView alloc] initWithFrame:frame];
    
    CGRect textFieldRect = CGRectMake([backgroundView bounds].size.width/2-120, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    // Setting the border style on the text field will allow us to see it more easily
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    
    // There will be a warning on this line. We wil discuss it shortly
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    
    
    // Set it as *the* view of this view controller
    self.view = backgroundView;
}

-(void)drawHypnoticMessage:(NSString *)message
{
    for (int i= 0; i < 20; i++) {
        UILabel *messagelabel = [[UILabel alloc] init];
        
        //Configure the label's colors and text
        messagelabel.backgroundColor = [UIColor clearColor];
        messagelabel.textColor = [UIColor blackColor];
        messagelabel.text = message;
        
        // This method resizes the label, which will be relatvie
        // to the text that it is displaying
        [messagelabel sizeToFit];
        
        // Get a random x value that fits within the hypnosis view's width
        int width = self.view.bounds.size.width - messagelabel.bounds.size.width;
        int x = arc4random() % width;
        
        // Get a random y value that fits within the hypnosis view's height
        int height = self.view.bounds.size.height - messagelabel.bounds.size.height;
        int y = arc4random() % height;
        
        // Update the label's frame
        CGRect frame = messagelabel.frame;
        frame.origin = CGPointMake(x, y);
        messagelabel.frame = frame;
        
        // Add the label to the hierarchy
        [self.view addSubview:messagelabel];
        
        
        
        // Add Motion Effects
        // Parallax
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @-25;
        motionEffect.maximumRelativeValue = @25;
        [messagelabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @-25;
        motionEffect.maximumRelativeValue = @25;
        [messagelabel addMotionEffect:motionEffect];
        
    }
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    [textField resignFirstResponder];
    
    
    return YES;
}

@end
