//
//  PlayingCard.m
//  OOP-Cards-Model
//
//  Created by Amitai Blickstein on 6/10/15.
//  Copyright (c) 2015 Al Tyus. All rights reserved.
//
//♥♠♣♦

#import "FISPlayingCard.h"

@implementation FISPlayingCard

-(instancetype)initWithSuit:(NSString*)suit rank:(NSNumber*)rank {
    self = [super init];
    if (self) {
            _rank = rank;
        if (!self.isProperRank)
            _rank = @0;
        
        _suit = suit;
        if (!self.isProperSuit)
            _suit = @"";
    }
    return self;
}

-(instancetype)init {
    return [self initWithSuit:@"" rank:@0];
}

-(void)setRank:(NSNumber *)rank {
    //overrides setter to check for validity
    _rank = rank;
    if (!self.isProperRank)
        _rank = @0;
}

-(void)setSuit:(NSString *)suit {
    //overrides setter to check for validity
    _suit = suit;
    if (!self.isProperSuit) {
        _suit = @"";
    }
}

-(NSString*)description {
    return [NSString stringWithFormat:@"%li of %@", (long)self.rank, self.suit];
}

-(BOOL)isProperRank {
    return NSLocationInRange([self.rank intValue], NSMakeRange(1, 13));
}
-(BOOL)isProperSuit {
    if (!self.isSingleChar)
        return NO;
    
    NSCharacterSet *suitSymbols = [NSCharacterSet characterSetWithCharactersInString:@"♥♠♣♦"];
    unichar possibleSuit = [self.suit characterAtIndex:0];
    
    if ([suitSymbols characterIsMember:possibleSuit])
        return YES;
    else
        return NO;
}
-(BOOL)isSingleChar {
    if (self.suit.length != 1)
        return NO;
    else return YES;
}

-(void)setRankByName {
    switch ([self.rank intValue]) {
        case 1:
            _rankByName = @"Ace";
            break;
        case 11:
            _rankByName = @"Jack";
            break;
        case 12:
            _rankByName = @"Queen";
            break;
        case 13:
            _rankByName = @"King";
            break;
            
        default:
            _rankByName = nil;
            break;
    }
}

@end
