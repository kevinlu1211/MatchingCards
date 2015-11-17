//
//  ViewController.h
//  MatchingCards
//
//  Created by Kevin Lu on 29/07/2015.
//  Copyright (c) 2015 Kevin Lu. All rights reserved.
//
// Abstract class. Must implement methodss as described below
#import <UIKit/UIKit.h>
#import "Deck.h"
@interface ViewController : UIViewController

// protected
// for subclasses
- (Deck *)createDeck; // abstract

@end

