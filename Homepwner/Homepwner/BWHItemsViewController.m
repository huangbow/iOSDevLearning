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
#import "BWHDetailViewController.h"

@interface BWHItemsViewController () <UITableViewDataSource>

//@property (nonatomic, strong) IBOutlet UIView *headerView;

@end

@implementation BWHItemsViewController


-(instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
//        for (int i = 0; i < 10; i++) {
//            [[BWHItemStore sharedStore] createItem];
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Homepwner";
        
        // Create a new bar button item that will send
        // addNewItem: to BWHItemsViewController
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        
        // Set this bar button item as the right item in the navigationItem
        navItem.rightBarButtonItem =bbi;
        
        navItem.leftBarButtonItem = self.editButtonItem;
        
        }
    
    return self;
    
}

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}



//-(UIView *)headerView
//{
//    // If you have not load headerView yet...
//    if (!_headerView) {
//        
//        // Load HeaderView.xib
//        [[NSBundle mainBundle] loadNibNamed:@"HeaderView"
//                                      owner:self
//                                    options:nil];
//    }
//    
//    return _headerView;
//}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
//    UIView *header = self.headerView;
//    [self.tableView setTableHeaderView:header];
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


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If the table view is asking to commit a delete commend..
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *items = [[BWHItemStore sharedStore] allItems];
        BWItem *item = items[indexPath.row];
        [[BWHItemStore sharedStore] removeItem:item];
        
        // Also remove that row from the table view with an animation
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}


-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BWHItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

-(IBAction)addNewItem:(id)sender
{
    // Make a new index path for the 0th section, last row
//    NSInteger lastRow = [self.tableView numberOfRowsInSection:0];
    // Create a new BHItem an add it to the store
    BWItem *newItem = [[BWHItemStore sharedStore] createItem];
    
//    // Figure out where that item is in the array
//    NSInteger lastRow = [[[BWHItemStore sharedStore] allItems] indexOfObject:newItem];
//    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
//    
//    // Insert this new row into the table.
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
    BWHDetailViewController *detailViewController = [[BWHDetailViewController alloc] initForNewItem:YES];
    detailViewController.item = newItem;
    
    detailViewController.dismissBlock = ^{
        [self.tableView reloadData];
    };
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    navController.modalPresentationStyle = UIModalPresentationFormSheet;
    navController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:navController animated:YES completion:NULL];
    
}

//-(IBAction)toggleEditingMode:(id)sender
//{
//    // If you are currently in editing mode...
//    if (self.isEditing) {
//        
//        // Change text of button to inform user of state
//        [sender setTitle:@"Edit" forState:UIControlStateNormal];
//        
//        // Turn off editing mode
//        [self setEditing:NO animated:YES];
//        
//    }else{
//        // Change text of button to inform user of state
//        [sender setTitle:@"Done" forState:UIControlStateNormal];
//        
//        // Enter editing mode
//        [self setEditing:YES animated:YES];
//    }
//    
//}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Remove";
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    BWHDetailViewController *detailViewController = [[BWHDetailViewController alloc] init];
    BWHDetailViewController *detailViewController = [[BWHDetailViewController alloc] initForNewItem:NO];
    
    NSArray *items = [[BWHItemStore sharedStore] allItems];
    BWItem *selectedItem = items[indexPath.row];
    
    // Give detail view controller a pointer to the item object in row
    detailViewController.item = selectedItem;
    
    
    // Push it onto the top of the navigation controller's stack
    [self.navigationController pushViewController:detailViewController animated:YES];
}


@end
