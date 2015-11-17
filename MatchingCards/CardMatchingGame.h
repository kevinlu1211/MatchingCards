//
//  CardMatchingGame.h
//  MatchingCards
//
//  Created by Kevin Lu on 5/08/2015.
//  Copyright (c) 2015 Kevin Lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (Card *)cardAtIndex:(NSUInteger)index;
- (void)chooseCardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@end
