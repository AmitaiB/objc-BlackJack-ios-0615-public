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

-(instancetype)init {
    self = [super init];
    if (self) {
        _cards = [[NSMutableArray alloc] init];
        _suitIconsByName = @{@"hearts":@"♥",
                          @"spades":@"♠",
                          @"clubs":@"♣",
                          @"diamonds":@"♦"};

        for (NSString *suit in [_suitIconsByName allValues]) {
            for (NSUInteger rank = 1; rank <= 13; rank++) {
                FISPlayingCard* newCard = [[FISPlayingCard alloc] initWithSuit:suit rank:@(rank)];
                [_cards addObject:newCard];
            }
        }
    }
        //        for (NSInteger i = 0; i < decks; i++)
//    [self addStandardDeck];
//        _fullDeck = self.isFull;
        
    return self;
}

//-(instancetype)init {
//    return [self initMultipleDecks:1];
//}

//Adds 13 cards for each of the 4 suits.
//-(void)addStandardDeck {
//        }
//    }
//}

-(BOOL)isFull {
    return ([self.cards count] == 52) ?  YES : NO;
}


-(FISPlayingCard*)drawRandomCard {
    if ([self.cards count] == 0)
        return [[FISPlayingCard alloc] init];
    
    NSUInteger randomFromRemainingCards = (NSUInteger)roundf([self randomFloatBetweenNumber:1 andNumber:(self.cards.count)]);

    NSLog(@"randomFromRemainingCards: %lul", (unsigned long)randomFromRemainingCards);
    FISPlayingCard *drawnCard = (FISPlayingCard*)self.cards[randomFromRemainingCards -1];
    [self.cards removeObjectAtIndex:randomFromRemainingCards -1];
    
    return drawnCard;
}

-(CGFloat)randomFloatBetweenNumber:(CGFloat)minRange andNumber:(CGFloat)maxRange
{
    return ((float)arc4random() / ARC4RANDOM_MAX) * (maxRange - minRange);
}



@end
