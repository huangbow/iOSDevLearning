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
        items=nil;
        
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
        
        item=nil;
        
        
        
        
        
    }
    return 0;
}
