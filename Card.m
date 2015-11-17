//
//  Card.m
//  MatchingCards
//
//  Created by Kevin Lu on 29/07/2015.
//  Copyright (c) 2015 Kevin Lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Card()
    // This is where the private declarations go
@end
@implementation Card

/*
The setter and getter functions are already generated behind the scenes
 when the property is defined in the .h file only implement them if you 
 need to get something other than the what the setter and getter functions return
 

@synthesize contents = _contents;
 
The @synthesize is the line of code that actually creates the backing instance variable 
 (instance variable basically means the how we can have access to that property in our .m
 file?) that is set and gotten. The default backing variable's name is the same as the property's
 name but with an underbar in front.
 
- (NSString *)contents // getter
{
    return _contents;
}
- (void)setContents:(NSString *)contents // setter
{
    _contents = contents;
}
 
@synthesize chosen = _chosen;
@synthesize matched = _matched;
 
- (BOOL)isChosen 
{
    return _chosen;
}
- (BOOL)setChosen:(BOOL)chosen 
{
    _chosen = chosen;
}
- (BOOL)matched 
{
    return _matched;
}
- (BOOL)setmatched:(BOOL)matched
{
    _matched = matched;
}
*/

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score++;
        }
    }
    return score;
}

@end