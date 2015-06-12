//
//  FISPlayingCardDeck.m
//  BlackJack
//
//  Created by Amitai Blickstein on 6/12/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#define ARC4RANDOM_MAX 0x100000000
#import "FISPlayingCardDeck.h"
//♥♠♣♦

@implementation FISPlayingCardDeck

-(instancetype)initMultipleDecks:(NSUInteger)decks {
    self = [super init];
    if (self) {
        _suitIconsByName = @{@"hearts":@"♥",
                          @"spades":@"♠",
                          @"clubs":@"♣",
                          @"diamonds":@"♦"};
        for (NSInteger i = 0; i < decks; i++)
            self.addStandardDeck;
        _fullDeck = self.isFull;
    }
    return self;
}

-(instancetype)init {
    return [self initMultipleDecks:1];
}

//Adds 13 cards for each of the 4 suits.
-(void)addStandardDeck {
    for (NSString *suit in [_suitIconsByName allValues]) {
        for (NSUInteger rank = 1; rank <= 13; rank++) {
            FISPlayingCard* newCard = [[FISPlayingCard alloc] initWithSuit:suit rank:@(rank)];
            [_cards addObject:newCard];
        }
    }
}

-(BOOL)isFull {
    return ([_cards count] == 52) ?  YES : NO;
}


-(FISPlayingCard*)drawRandomCard {
    NSUInteger randomFromRemainingCards = (NSUInteger)roundf([self randomFloatBetweenNumber:0 andNumber:(_cards.count-1)]);

    NSLog(@"randomFromRemainingCards: %d", randomFromRemainingCards);
    FISPlayingCard *drawnCard = _cards[randomFromRemainingCards];
    [_cards removeObjectAtIndex:randomFromRemainingCards];
    
    return drawnCard;
}

-(CGFloat)randomFloatBetweenNumber:(CGFloat)minRange andNumber:(CGFloat)maxRange
{
    return ((float)arc4random() / ARC4RANDOM_MAX) * (maxRange - minRange);
}



@end
