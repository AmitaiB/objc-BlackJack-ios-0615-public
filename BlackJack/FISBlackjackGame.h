//
//  FISBlackjackGame.h
//  BlackJack
//
//  Created by Amitai Blickstein on 6/12/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISPlayingCardDeck.h"

@interface FISBlackjackGame : NSObject

@property (strong, nonatomic) FISPlayingCardDeck *playingCardDeck; // the playingCardDeck in use
@property (strong, nonatomic) NSNumber *handScore; // returns the total value of cards in the hand. Remember: Aces can be 1 or 11 !!!
@property (strong, nonatomic) NSMutableArray *hand; //returns the cards in the hand
@property (nonatomic) BOOL isBusted;
@property (nonatomic) BOOL isBlackjack;

- (instancetype)init; // should initialize playingCardDeck with a new deck, set handScore and isBusted to default values
-(void)setupNewRound;
- (void)deal; // should deal 2 new cards and add those cards to the hand.
- (void)hit; // should deal one additional card and add it card to the hand.
-(void)checkHandScore;
-(BOOL) checkIfBusted; // returns YES if handScore is more than 21
-(BOOL) checkIfBlackjack; // returns YES if handScore is 21
@end
