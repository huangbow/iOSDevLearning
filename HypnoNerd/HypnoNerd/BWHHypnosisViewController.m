//
//  BWHHypnosisViewController.m
//  HypnoNerd
//
//  Created by Bowen Huang on 4/12/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWHHypnosisViewController.h"
#import "BWHHypnosisView.h"

@interface BWHHypnosisViewController()

@property (nonatomic, strong) NSArray *colorArr;
@property (nonatomic, strong) IBOutlet UISegmentedControl *segControl;
@property (nonatomic, strong) BWHHypnosisView *backgroundView;

@end


@implementation BWHHypnosisViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        
        // Put that image on the tabe bar item
        self.tabBarItem.image = image;
        
        self.colorArr = @[@"Red",@"Green",@"Blue"];
    }
    
    return self;
}


-(void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    self.backgroundView = [[BWHHypnosisView alloc] initWithFrame:frame];
    
    // Set it as *the* view of this view controller
    self.view = self.backgroundView;
    
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    self.segControl = [[UISegmentedControl alloc] initWithItems:_colorArr];
    self.segControl.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-80, 100, 160, 30);
    self.segControl.backgroundColor = [UIColor whiteColor];
    [self.segControl addTarget:self action:@selector(colorChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segControl];
    
    NSLog(@"HypnosisViewController is loaded!");
}

-(void)colorChange
{
    UIColor *color;
    NSLog(@"index=%ld",(long)[self.segControl selectedSegmentIndex]);
    int index = (int)[self.segControl selectedSegmentIndex];
    if (index==0) {
        color = [UIColor redColor];
    }else if (index==1){
        color = [UIColor greenColor];
    }else{
        color = [UIColor blueColor];
    }
    self.backgroundView.circleColor = color;
}

@end
