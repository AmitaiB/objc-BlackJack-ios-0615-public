//
//  Card.m
//  OOP-Cards-Model
//
//  Created by Amitai Blickstein on 6/10/15.
//  Copyright (c) 2015 Al Tyus. All rights reserved.
//

#import "Card.h"

@implementation Card

-(instancetype)initWithCardNumber:(NSNumber*)cardNumber brand:(NSString*)brand positionInDeck:(NSNumber*)positionInDeck {
    self = [super init];
    if (self) {
        _cardNumber = cardNumber;
        _brand = brand;
        _faceUp = NO;
        _positionInDeck = positionInDeck;
    }
    return self;
}

-(instancetype)initWithCardNumber:(NSNumber*)cardNumber brand:(NSString*)brand {
    return [self initWithCardNumber:cardNumber brand:brand positionInDeck:@(-1)];
}

-(instancetype)init {
    return [self initWithCardNumber:@0 brand:@"" positionInDeck:@(-1)];
}

-(BOOL)isFaceUp {
    return self.faceUp;
}

@end
