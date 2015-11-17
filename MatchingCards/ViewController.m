//
//  ViewController.m
//  MatchingCards
//
//  Created by Kevin Lu on 29/07/2015.
//  Copyright (c) 2015 Kevin Lu. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"

@interface ViewController ()

// Notice how this is weak declaration because the MVC's (Model View Controller) View already has a strong pointer to UILabel
/*
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong,nonatomic) Deck *deck;
*/
@property (strong,nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController
// Note that the button method is actually touchCardButton:
// Note that IBAction is just typedef void IBAction

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    }
    return _game;
}
// Deck instantiator
/*
- (Deck *) deck
{
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}
*/

// Notice how if this createDeck didn't return PlayingCardDeck we would have a higher level of abstraction as the view controller wouldn't be limited to just showing a class of PlayingCardDeck

- (Deck *)createDeck // abstract
{
    // Note that even though the function says that we return a Deck, we can return a subclass of deck, namely PlayingCardDeck as it inherits from Deck

    // return [[PlayingCardDeck alloc] init];
    // Now we return nil to create a higher level of abstraction
    
    return nil;
}



- (IBAction)touchCardButton:(UIButton *)sender
{
    // Old touchCardButton implementation
    /*
    // Note how we can't do self.deck.cards because .cards is a private declaration and can't be called outside the function
    for (Card *card in self.deck.cards) {
        NSLog(@"%@\n", card.contents);
    }
     
    // What we could do is:
    Card *printThisCard = [self.deck drawRandomcard];
    while (printThisCard) {
        NSLog(@"This card is: %@", printThisCard.contents);
        printThisCard = [self.deck drawRandomcard];
    }
    
    
    // Finding the length of the button title so that if it is 0
    // then it means that we are on the CardBack and we need to change
    // to the CardFront
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage: [UIImage imageNamed:@"CardBack"]
                          forState:UIControlStateNormal];
        [sender setTitle: @"" forState:UIControlStateNormal];
    }
    else {
        Card *randomCard = [self.deck drawRandomcard];
        if (randomCard) {
            [sender setBackgroundImage: [UIImage imageNamed:@"CardFront"]
                              forState:UIControlStateNormal];
            // Note here that we are able to call randomCard.contents as we created PlayingCardDeck not which has elements of
            // PlayingCards in its array, and we are able to set PlayingCards to type Card as it is a subclass of Card
            [sender setTitle: randomCard.contents forState:UIControlStateNormal];
 
        }
    }
    self.flipCount++; // This invokes both the setter and getter property for flipCount
    */
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
    }
}

- (NSString *)titleForCard:(Card *)card
{
    if (card.isChosen) {
        return card.contents;
    }
    else {
        return @"";
    }
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    if (card.isChosen) {
        return [UIImage imageNamed:@"CardFront"];
    }
    else {
        return [UIImage imageNamed:@"CardBack"];
    }
}
// FlipLabel implementation
/*
// Now we have to modify the setter function for flipCount
// Note that flipCount default to 0
- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips:%d",self.flipCount];
}
*/
@end
