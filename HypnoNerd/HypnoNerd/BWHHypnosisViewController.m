//
//  BWHHypnosisViewController.m
//  HypnoNerd
//
//  Created by Bowen Huang on 4/12/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWHHypnosisViewController.h"
#import "BWHHypnosisView.h"

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
    
    // Set it as *the* view of this view controller
    self.view = backgroundView;
    UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    b.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:b];
    
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
}

@end
