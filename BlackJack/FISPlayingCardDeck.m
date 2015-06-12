//
//  FISPlayingCardDeck.m
//  BlackJack
//
//  Created by Amitai Blickstein on 6/12/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

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
    }
    return self;
}

-(instancetype)init {
    return [self initMultipleDecks:1];
}

-(void)addStandardDeck {
    for (NSString *suit in [_suitIconsByName allValues]) {
        for (NSUInteger rank = 1; rank <= 13; rank++) {
            FISPlayingCard* newCard = [[FISPlayingCard alloc] initWithSuit:suit rank:rank];
            [_cards addObject:newCard];
        }
    }
}

@end
