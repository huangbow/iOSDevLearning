//
//  BWItem.m
//  RandomItems
//
//  Created by Alex on 3/29/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWItem.h"

@implementation BWItem

+(instancetype)randomItem
{
    //Create an immuatble array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    //Create an immutable array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    //Get the index of a random adjective/noun from the lists
    //Note NSInteger is not a object, but a type definition
    //for "long"
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                                [randomAdjectiveList objectAtIndex:adjectiveIndex],
                                [randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    BWItem *newItem = [[self alloc] initWithItemName:randomName
                                      valueInDollars:randomValue
                                        serialNumber:randomSerialNumber];
    
    return newItem;
    
}

-(instancetype)initWithItemName:(NSString *)name
                 valueInDollars:(int)value
                   serialNumber:(NSString *)sNumber
{
    //Call the superclass's designated iitializer
    self = [super init];
    
    //Did the superclass's designated initializer succeed?
    if (self) {
        //Give the instance varialbels initial values
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        //Set _dateCreated to the current date and time
        _dateCreated = [[NSDate alloc] init];
    }
    
    //Return the address of the newly initialized object
    return self;
}

-(instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
}

-(instancetype)initWithItemName:(NSString *)name
                   serialNumber:(NSString *)sNumber
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:sNumber];
}

-(instancetype)init
{
    return [self initWithItemName:@"Item"];
}


-(void) dealloc
{
    NSLog(@"Destroyed: %@", self);
}




-(void)setContainedItem:(BWItem *)item
{
    _containedItem = item;
    self.containedItem.container = self;
}




@end
