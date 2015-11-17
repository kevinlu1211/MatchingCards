//
//  Deck.m
//  MatchingCards
//
//  Created by Kevin Lu on 29/07/2015.
//  Copyright (c) 2015 Kevin Lu. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards; // Private declaration
@end

@implementation Deck

// Need this function as the getter function that is created behind the scenes don't create an array for us
- (NSMutableArray *)cards
{
    if (!_cards) {
       _cards = [[NSMutableArray alloc] init]; 
    }
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    }
    else {
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}
- (Card *)drawRandomcard
{
    Card *randomCard = nil;
    if ([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index]; // same as [self.card objectAtIndexedSubscript: index]
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}



@end
