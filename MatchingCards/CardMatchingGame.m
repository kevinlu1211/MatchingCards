//
//  CardMatchingGame.m
//  MatchingCards
//
//  Created by Kevin Lu on 5/08/2015.
//  Copyright (c) 2015 Kevin Lu. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of Card
@end

@implementation CardMatchingGame

- (NSMutableArray *) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomcard];
            if (card) {
                [self.cards addObject: card]; // same as append
            }
            else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    if (index<[self.cards count]) {
        return self.cards[index];
    }
    else {
        return nil;
    }
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    // Checking if the card is matched already
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // This forloop iterates through all the cards that were created
            for (Card *otherCard in self.cards) {
                // if any of the cards are chosen and they aren't matched see if they match
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    }
                    else {
                        // If the other card doesn't match then we "unchoose it"
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}
@end
