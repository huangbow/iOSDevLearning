//
//  BWItem.h
//  RandomItems
//
//  Created by Alex on 3/29/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BWItem : NSObject
//{
//    NSString *_itemName;
//    NSString *_serialNumber;
//    int _valueInDollars;
//    NSDate *_dateCreated;
//    
//    BWItem *_containedItem;
//    __weak BWItem *_container;
//    
//}

//@property (strong, nonatomic) BWItem *containedItem;
//@property (weak, nonatomic) BWItem *container;

@property (copy, nonatomic) NSString *itemName;
@property (copy, nonatomic) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (readonly, strong, nonatomic) NSDate *dateCreated;
@property (nonatomic, copy) NSString *itemKey;



+ (instancetype)randomItem;

//Designed initializer for BWItem
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

- (instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber;





- (void)setItemName:(NSString *)str;
- (NSString *)itemName;
- (void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;
- (void)setValueInDollars:(int)v;
- (int)valueInDollars;
- (NSDate *)dateCreated;
//- (void)setContainedItem:(BWItem *)item;
//- (BWItem *)containedItem;
//- (void)setContainer:(BWItem *)item;
//- (BWItem *)container;

@end
