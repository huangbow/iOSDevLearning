//
//  BWItem.m
//  RandomItems
//
//  Created by Alex on 3/29/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWItem.h"

@implementation BWItem

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





@end
