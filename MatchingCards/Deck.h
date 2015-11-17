//
//  Deck.h
//  MatchingCards
//
//  Created by Kevin Lu on 29/07/2015.
//  Copyright (c) 2015 Kevin Lu. All rights reserved.
//

#ifndef MatchingCards_Deck_h
#define MatchingCards_Deck_h
#endif

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop; // Note that there are no optional parameter,
                                                // to fix just create a new function
- (void)addCard:(Card *)card;
- (Card *)drawRandomcard;
@end
