//
//  PlayingCardGameViewController.m
//  MatchingCards
//
//  Created by Kevin Lu on 8/08/2015.
//  Copyright (c) 2015 Kevin Lu. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
@interface PlayingCardGameViewController ()

@end

// Notice how we don't have to link the buttons up with this view controller because it is already implemented in the superclass that is ViewController
@implementation PlayingCardGameViewController

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
