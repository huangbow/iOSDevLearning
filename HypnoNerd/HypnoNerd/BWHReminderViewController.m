//
//  BWHReminderViewController.m
//  HypnoNerd
//
//  Created by Bowen Huang on 4/12/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWHReminderViewController.h"

@interface BWHReminderViewController()

@property (nonatomic, weak) IBOutlet UIDatePicker *dataPicker;

@end

@implementation BWHReminderViewController


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Reminder";
        self.tabBarItem.image = [UIImage imageNamed:@"Time.png"];
    }
    
    return self;
}


- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.dataPicker.date;
    NSLog(@"Setting a reminder for %@", date);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.dataPicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end
