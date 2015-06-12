//
//  Card.m
//  OOP-Cards-Model
//
//  Created by Amitai Blickstein on 6/10/15.
//  Copyright (c) 2015 Al Tyus. All rights reserved.
//

#import "Card.h"

@implementation Card

-(instancetype)initWithCardNumber:(NSNumber*)cardNumber brand:(NSString*)brand {
    self = [super init];
    if (self) {
        _cardNumber = cardNumber;
        _brand = brand;
        _faceUp = NO;
    }
    return self;
}

-(instancetype)init {
    return [self initWithCardNumber:@0 brand:@""];
}

-(BOOL)isFaceUp {
    return self.faceUp;
}

@end
