//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Amitai Blickstein on 6/12/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

-(instancetype)init {
    self = [super init];
    if (self) {
        _playingCardDeck = [[FISPlayingCardDeck alloc] init];
        _hand = [[NSMutableArray alloc] init];
        [self refreshHandScore];
    }
    return self;
}

//Make sure the hand is empty, then deal.
-(void)deal {
    [_hand removeAllObjects];
    [_hand addObject:_playingCardDeck.drawRandomCard]; //1
    [_hand addObject:_playingCardDeck.drawRandomCard]; //2
}

//After dealing, hit to add a card, until blackjack or bust.
-(void)hit {
    if ((_hand.count < 2) ||
        )
        return;
    
    [_hand addObject:_playingCardDeck.drawRandomCard]; // _hand++
}

-(void)refreshHandScore {
    NSUInteger handScoreTemp = 0;
    NSUInteger acesInHand = 0;
    
    for (FISPlayingCard *card in _hand) {
        if (card.rank == 1) {
            acesInHand++;
            handScoreTemp += 11;
        } else {
            handScoreTemp += card.rank;
        }
    }
    
    for (NSUInteger i = acesInHand; i > 0; i--) {
        (handScoreTemp > 21)? handScoreTemp -= 10 : break;
    }
    
    _handScore = [NSNumber numberWithInteger:handScoreTemp];
    
}

-(BOOL)isBusted {
    return (_handScore > 21) ? YES : NO;
}

-(BOOL) isBlackjack {
    return (_handScore == 21) ? YES: NO;
}

@end
