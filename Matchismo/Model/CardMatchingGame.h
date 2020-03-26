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

@property (nonatomic) NSInteger score;
@property (strong, nonatomic) NSString *lastAction;
@property (nonatomic, strong) NSMutableArray *cards; //ofCards

//designated initializer
- (instancetype)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;
- (instancetype)restartWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;
//- (NSDictionary *)getPoints;
@end

