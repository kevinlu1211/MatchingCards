//
//  Card.h
//  MatchingCards
//
//  Created by Kevin Lu on 29/07/2015.
//  Copyright (c) 2015 Kevin Lu. All rights reserved.
//

/*
 #define one 0
 +--- #ifdef one
 |    printf("one is defined ");     // Everything in here is included.
 | +- #ifndef one
 | |  printf("one is not defined "); // Everything in here is excluded.
 | |  :
 | +- #endif
 |    :                              // Everything in here is included again.
 +--- #endif
 */

#ifndef MatchingCards_Card_h
#define MatchingCards_Card_h
#endif

// #import <Foundation/Foundation.h> This is the old method

@import Foundation; // This is the new method

/*
Strong - keep the object that this property points to in memory until I set this property to nil
(and it will stay in memory until everyone who has a strong pointer to it sets their property to nil too
 
 Weak - if no one else has a strong pointer to this object, then you can throw it out of memory
 and set this property to nil
 
 Nonatomic - access to this property is not thread-safe i.e. you can't access the property if another
 thread is currently accessing it
*/

@interface Card : NSObject

/*
 In iOS, we don't access variables directly.
 Instead we use an @property which declares two methods: a "setter" and a "getter".
 It is with those two methods that the @property's instance variable is accessed
 (both publicly and privately).
 
 This particular @property *contents is a pointer that inherits from NSString.
 
 All objects live in the heap, thus you would never have a property of type "NSString"
 as it is a objective and hence is a pointer
 
 As this @property is in the class's header file, it is public, it's setter and getter
 can be called from outside this class's @implementation block.
*/
@property(strong, nonatomic) NSString *contents;


// This changes the name of getter and setter functions that are generated behind the scenes
@property(nonatomic, getter=isChosen) BOOL chosen;

// Notice how there is no strong as it is a primitive type
@property(nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end