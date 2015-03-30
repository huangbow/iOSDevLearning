//
//  BWItem.m
//  RandomItems
//
//  Created by Alex on 3/29/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWItem.h"

@implementation BWItem

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

-(instancetype)init
{
    return [self initWithItemName:@"Item"];
}


-(void)setItemName:(NSString *)str {
    _itemName = str;
}


-(NSString *)itemName {
    return _itemName;
}

-(void)setSerialNumber:(NSString *)str {
    _serialNumber=str;
}

-(NSString *)serialNumber {
    return _serialNumber;
}

-(NSDate *)dateCreated {
    return _dateCreated;
}

-(void)setValueInDollars:(int)v {
    _valueInDollars=v;
}

-(int)valueInDollars {
    return _valueInDollars;
}

-(NSString *) description {
    NSString *desceiptionString =
        [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                            self.itemName,
                            self.serialNumber,
                            self.valueInDollars,
                            self.dateCreated];
    return desceiptionString;
}




@end
