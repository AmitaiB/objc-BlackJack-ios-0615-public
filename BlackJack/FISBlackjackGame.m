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

//Add score with AllAces1, if score < 12, add 10 (only want one ace + 10)
-(void)checkHandScore {
    NSUInteger handScoreTemp = 0;
    BOOL handIncludesAnAce = NO;
    
    for (FISPlayingCard *card in self.hand) {
        if ([card.rank isEqualToNumber:@1])
            handIncludesAnAce = YES;
        handScoreTemp += [card.rank integerValue];
    }
    NSLog(@"FROM inside checkHandScore, BEFORE accounting for Aces. handScoreTemp = %lu", (unsigned long)handScoreTemp);
    
    if (handIncludesAnAce && handScoreTemp < 12) {
        handScoreTemp += 10;
    }

    NSLog(@"FROM inside checkHandScore, AFTER accounting for Aces. handScoreTemp = %lu", (unsigned long)handScoreTemp);

    
    self.handScore = [NSNumber numberWithUnsignedInteger:handScoreTemp];
    [self isBusted];
    [self isBlackjack];
    
}

-(BOOL)isBusted {
    self.isBusted = ([self.handScore intValue] > 21);
    return self.isBusted;
}

-(BOOL)isBlackjack {
    self.isBlackjack = ([self.handScore intValue] == 21);
    return self.isBusted;
}

-(void)setHand:(NSMutableArray*)newHand {
    _playingCardDeck = [[FISPlayingCardDeck alloc] init];
    [_hand removeAllObjects];
    [_hand addObjectsFromArray:newHand];
    [_playingCardDeck.cards removeObjectsInArray:newHand];
    NSLog(@"self.playingCardDeck.cards count READS AS = %lu", (unsigned long)[self.playingCardDeck.cards count]);
    [self checkHandScore];
}

@end
