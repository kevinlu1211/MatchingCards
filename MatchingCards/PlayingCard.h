//
//  PlayingCard.h
//  MatchingCards
//
//  Created by Kevin Lu on 29/07/2015.
//  Copyright (c) 2015 Kevin Lu. All rights reserved.
//

#ifndef MatchingCards_PlayingCard_h
#define MatchingCards_PlayingCard_h
#endif

#import "Card.h" // Importing our superclass

@interface PlayingCard : Card

// Note that the suit and rank are defined here and not in the Card files because
// the card can be any random card and doesn't have to be a playing card with a rank
// and a suit, this is OOP.
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
@end