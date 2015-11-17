//
//  PlayingCardDeck.m
//  MatchingCards
//
//  Created by Kevin Lu on 29/07/2015.
//  Copyright (c) 2015 Kevin Lu. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"
@implementation PlayingCardDeck

// Notice how we are creating a new init for this class
-(instancetype) init
{
    // This is init using NSObject
    self = [super init];
    
    if (self){
        
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank ++) {
                // Notice here that we are creating a new PlayingCard instance
                // And using the methods already defined in PlayingCard to create
                // The cards.
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                // As our super class is Deck we can access it and use the addCard method
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
