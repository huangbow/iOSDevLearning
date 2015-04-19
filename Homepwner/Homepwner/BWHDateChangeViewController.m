//
//  BWHDateChangeViewController.m
//  Homepwner
//
//  Created by Bowen Huang on 4/18/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWHDateChangeViewController.h"
#import "BWItem.h"

@interface BWHDateChangeViewController ()

@end

@implementation BWHDateChangeViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"Change Date";
    }
    
    return self;
}


-(void)viewWillAppear:(BOOL)animated
{
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.view endEditing:YES];
    self.item.dateCreated = [self.datePicker date];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
