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

@property (nonatomic,strong) NSMutableArray *itemsValueMoreThanFifty;
@property (nonatomic, strong) NSMutableArray *itemsValueNoMoreThanFifty;

@end

@implementation BWHItemsViewController


-(instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 10; i++) {
            [[BWHItemStore sharedStore] createItem];
        }
        [self countObjectInUWItem];
//        UIView *background = [[UIView alloc] initWithFrame:[self.tableView bounds]];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
        self.tableView.backgroundView = bgImageView;
        
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(void)countObjectInUWItem
{
    _itemsValueMoreThanFifty = [[NSMutableArray alloc] init];
    _itemsValueNoMoreThanFifty = [[NSMutableArray alloc] init];
    NSArray *items = [[BWHItemStore sharedStore] allItems];
    for (int i=0; i < [items count]; i++) {
        if ([items[i] valueInDollars] > 70) {
            [self.itemsValueMoreThanFifty addObject:items[i]];
        }else{
            [self.itemsValueNoMoreThanFifty addObject:items[i]];
        }
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return [self.itemsValueMoreThanFifty count];
    }else{
        return [self.itemsValueNoMoreThanFifty count];
    }
//    return [[[BWHItemStore sharedStore] allItems] count];
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
//    NSArray *items = [[BWHItemStore sharedStore] allItems];
//    BWItem *item = items[indexPath.row];
//    
//    cell.textLabel.text = [item description];
    
    tableView.rowHeight = 60;
    if (indexPath.section==0) {
        cell.textLabel.text = [self.itemsValueMoreThanFifty[indexPath.row] description];
        cell.textLabel.font = [UIFont systemFontOfSize:20.0];
    }else{
        if ([self.itemsValueNoMoreThanFifty count] - indexPath.row <2) {
            cell.textLabel.text = @"No more items!";
            tableView.rowHeight = 44;
            return cell;
        }
        cell.textLabel.font = [UIFont systemFontOfSize:20.0];
        cell.textLabel.text = [self.itemsValueNoMoreThanFifty[indexPath.row] description];
    }
    
    return cell;
}


@end
