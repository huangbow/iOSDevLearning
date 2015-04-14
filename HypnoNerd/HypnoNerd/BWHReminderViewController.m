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

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.dataPicker.date;
    NSLog(@"Setting a reminder for %@", date);
}

@end
