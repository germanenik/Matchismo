//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by German Enik on 3/22/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSString *lastAction;

//designated initializer
- (instancetype)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;
- (instancetype)restartWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;
@end

