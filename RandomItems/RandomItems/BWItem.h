//
//  BWItem.h
//  RandomItems
//
//  Created by Alex on 3/29/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BWItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

//Designed initializer for BWItem
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

- (void)setItemName:(NSString *)str;
- (NSString *)itemName;
- (void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;
- (void)setValueInDollars:(int)v;
- (int)valueInDollars;
- (NSDate *)dateCreated;

@end
