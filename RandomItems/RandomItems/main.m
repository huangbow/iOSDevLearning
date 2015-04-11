//
//  main.m
//  RandomItems
//
//  Created by Alex on 3/29/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BWItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        
        
        //Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        //Send the message addOject: to the NSmutableArray pointed to
        //by the variable items, passing a string each time
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];

        //Send another messange, insertObject:atIndex:, to that same array object
        [items insertObject:@"Zero" atIndex:0];

        
        
        for (int i=0; i < [items count]; i++) {
            NSString *item = [items objectAtIndex:i];
            NSLog(@"%@", item);
        }

        
        //Destroy the mutable array object
//        items=nil;

        int a = 1;
        float b = 2.5;
        char c = 'A';
        NSLog(@"Interger: %d Float: %f Char: %c", a, b, c);
        
        
        BWItem *item = [[BWItem alloc] init];
        [item setItemName:@"Red Sofa"];
        [item setSerialNumber:@"A1B2C3"];
        [item setValueInDollars:100];

        
        NSLog(@"%@ %@ %@ %d", [item itemName],[item dateCreated],
              [item serialNumber], [item valueInDollars]);
        
        NSLog(@"%@", item);
        
//        item=nil;
        
//        BWItem *testItem = [BWItem randomItem];
        
        for (int i=0; i<10; i++) {
            BWItem *item1 = [BWItem randomItem];
            [items addObject:item1];
        }
        
        for (BWItem *item2 in items) {
            NSLog(@"%@", item2);
        }
        
        
        
//        id lastObj = [items lastObject];
        
        //lastObj is an instance of BWItem and will not understand the count message
//        [lastObj count];
        
//        NSLog(@"$@", [items objectAtIndex:51]);
        
//        NSLog(@"Setting items to nil...");
//        items=nil;
//        [items addObject:@"aa"];
//        NSLog(@"count: %ld",[items count]);
        
        NSMutableArray *itemset = [[NSMutableArray alloc] init];
        BWItem *backpack = [[BWItem alloc] initWithItemName:@"Backpack"];
        [itemset addObject:backpack];
        
        BWItem *calculator = [[BWItem alloc] initWithItemName:@"Calculator"];
        [itemset addObject:calculator];
        
        backpack.containedItem = calculator;
        backpack = nil;
        calculator = nil;
        itemset = nil;
        

        
        
        
    }
    return 0;
}
