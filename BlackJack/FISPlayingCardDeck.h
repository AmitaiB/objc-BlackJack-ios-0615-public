//
//  FISPlayingCardDeck.h
//  BlackJack
//
//  Created by Amitai Blickstein on 6/12/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISPlayingCard.h"
//♥♠♣♦

@interface FISPlayingCardDeck : NSObject

@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, strong) NSDictionary *suitIconsByName;


-(instancetype)initMultipleDecks:(NSUInteger)decks;
-(instancetype)init;

-(FISPlayingCard*)drawRandomCard;
//-(void)shuffle; Not needed if you can draw a random card.

-(void)addStandardDeck;
-(NSNumber*)remainingCardsNum;
-(NSArray*)remainingCardsList;



@end
