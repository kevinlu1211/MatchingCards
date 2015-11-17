//
//  PlayingCard.m
//  MatchingCards
//
//  Created by Kevin Lu on 29/07/2015.
//  Copyright (c) 2015 Kevin Lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCard.h"

@implementation PlayingCard

// Overriding the match method of the Card class
- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        }
        else if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        }
    }
    return score;
}

// We are overriding the implementation of the contents method in the Card class, but notice how we don't have to, notice how this method is defined in the PlayingCard .m file as it will never be used in the generic Card class
// define it in our .h file as it is already inherited from our superclass
- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",@"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank { return [[self rankStrings] count]-1; }

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
@synthesize suit = _suit; // Notice that this has to be added because we implemented both setter and getter functions

// overriding the setter function for suit
- (void)setSuit:(NSString *)suit
{
    /*
    if ([@[@"♥",@"♦",@"♠",@"♣"] containsObject:suit]) {
        _suit = suit;
    }
    */
    
     // Note how a higher level of abstraction can be achieved through:
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

// overriding the getter function for suit
- (NSString *)suit
{
    return _suit ? _suit : @"?";
    /*
     same as:
       if (suit) {
           return _suit;
       }
       else {
           return @"?"
       }
     */
}

@end