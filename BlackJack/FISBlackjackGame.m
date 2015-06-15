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
        _handScore = @0;
        _isBusted = NO;
        _isBlackjack = NO;
    }
    return self;
}

-(void)setupNewRound {
    self.playingCardDeck = [[FISPlayingCardDeck alloc] init];
    [self.hand removeAllObjects];
    [self checkHandScore];
}

//Make sure the hand is empty, then deal.
-(void)deal {
    [self setupNewRound];
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
}

-(void)setHand:(NSMutableArray*)newHand {
    [self setupNewRound];
    [self.hand addObjectsFromArray:newHand];
    [self.playingCardDeck.cards removeObjectsInArray:newHand];
    [self checkHandScore];
}

//Add score with AllAces1, if score < 12, add 10 (only want one ace + 10)
-(void)checkHandScore {
    NSUInteger handScoreTemp = 0;
    BOOL handIncludesAnAce = NO;
    
    for (FISPlayingCard *card in self.hand) {
        if ([card.rank isEqualToNumber:@1])
            handIncludesAnAce = YES;
        if ([card.rank integerValue] > 10)
            handScoreTemp += 10;
        else
            handScoreTemp += [card.rank integerValue];
    }
    NSLog(@"FROM inside checkHandScore, BEFORE accounting for Aces. handScoreTemp = %lu", (unsigned long)handScoreTemp);
    
    if (handIncludesAnAce && handScoreTemp < 12) {
        handScoreTemp += 10;
    }

    NSLog(@"FROM inside checkHandScore, AFTER accounting for Aces. handScoreTemp = %lu", (unsigned long)handScoreTemp);

    self.handScore = [NSNumber numberWithUnsignedInteger:handScoreTemp];
    [self checkIfBusted];
    [self checkIfBlackjack];
    
}

-(void)checkIfBusted {
    self.isBusted = [self.handScore integerValue] > 21;
}

-(void)checkIfBlackjack {
    self.isBlackjack = [self.handScore integerValue] == 21;}

@end
