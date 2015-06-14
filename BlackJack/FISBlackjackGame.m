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
        [self checkHandScore];
        _isBusted = NO;
        _isBlackjack = NO;
    }
    return self;
}

//Make sure the hand is empty, then deal.
-(void)deal {
    [self.hand removeAllObjects];
    [self.hand addObject:[self.playingCardDeck drawRandomCard]]; //1
    [self.hand addObject:[self.playingCardDeck drawRandomCard]]; //2
    [self checkHandScore];
}

//After dealing, hit to add a card, until blackjack or bust.
-(void)hit {
    NSLog(@"ABOUT TO HIT. isBusted = %@, isBlackjack = %@", self.isBusted? @"YES":@"NO", self.isBlackjack? @"YES":@"NO");
    if (self.isBusted || self.isBlackjack || ([self.hand count] < 2))
        return;
    [self.hand addObject:[self.playingCardDeck drawRandomCard]];
    [self checkHandScore];
        NSLog(@"JUST HIT. isBusted = %@, isBlackjack = %@", self.isBusted? @"YES":@"NO", self.isBlackjack? @"YES":@"NO");
    // _hand++
}

-(void)checkHandScore {
    NSUInteger handScoreTemp = 0;
    NSUInteger acesInHand = 0;
    
    for (FISPlayingCard *card in self.hand) {
        if ([card.rank isEqualToNumber: @1]) {
            handScoreTemp += 11;
            acesInHand += 11;
        } else {
            handScoreTemp += [card.rank integerValue];
        }
    }
    
    while ((acesInHand > 0) && (handScoreTemp > 21)) {
        handScoreTemp -= 10;
        acesInHand--;
    }
    
//    for (NSUInteger i = acesInHand; i > 0; i--) {
//        (handScoreTemp > 21)? handScoreTemp -= 10 : i;
//        i++;
//    }
    
    self.handScore = [NSNumber numberWithInteger:handScoreTemp];
    [self isBusted];
    [self isBlackjack];
    
}

-(BOOL)isBusted {
    return self.isBusted = ([self.handScore intValue] > 21);
}

-(BOOL) isBlackjack {
    return self.isBlackjack = ([self.handScore intValue] == 21);
}

-(void)setHand:(NSMutableArray *)newHand {
    [_hand addObjectsFromArray:newHand];
    [_playingCardDeck.cards removeObjectsInArray:newHand];
    [self checkHandScore];
}

@end
