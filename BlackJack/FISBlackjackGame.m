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
    }
    return self;
}

-(void)deal {
    [_hand removeAllObjects];
    [_hand addObject:_playingCardDeck.drawRandomCard]; //1
    [_hand addObject:_playingCardDeck.drawRandomCard]; //2
}

-(void)hit {
    if ((_hand.count < 2) ||
        )
        return;
    
    [_hand addObject:_playingCardDeck.drawRandomCard]; // _hand++
}

@end
