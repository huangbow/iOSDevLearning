//
//  BWHItemsViewController.m
//  Homepwner
//
//  Created by Bowen Huang on 4/15/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWHItemsViewController.h"
#import "BWItem.h"
#import "BWHItemStore.h"

@interface BWHItemsViewController () <UITableViewDataSource>
@end

@implementation BWHItemsViewController


-(instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 10; i++) {
            [[BWHItemStore sharedStore] createItem];
        }
        
    }
    return self;
    
}

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BWHItemStore sharedStore] allItems] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create an instance of UITableViewCell, with default appearance
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    // Get a new or recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    // Set the text on the cell with the description of the item
    // that is at the nth inde of items, where n = row this cell
    // will appear in on the tableview
    NSArray *items = [[BWHItemStore sharedStore] allItems];
    BWItem *item = items[indexPath.row];
    cell.textLabel.text = [item description];
    
    
    return cell;
}


@end
