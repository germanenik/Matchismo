//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by German Enik on 3/22/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
//@property (nonatomic, readwrite) NSInteger score;
//@property (nonatomic, readwrite) NSString *lastAction;
//@property (nonatomic, strong) NSMutableArray *cards; //ofCards
@end

@implementation CardMatchingGame

//getter for cards
- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

//initializer
- (instancetype)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        for (int i = 0; i < cardCount; i++){
            Card *card = [deck drawRandomCard];
            if (card) { //adding nil would crash the program
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
        self.score = 0;
        self.lastAction = @"Click on a card!";
    }
    return self;
}

- (instancetype)restartWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck {
    self.cards = nil;
    return [self initWithCardCount:cardCount usingDeck:deck];
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return index < [self.cards count] ? self.cards[index] : nil;
}

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self.cards objectAtIndex:index];
    card.chosen = !card.isChosen;
}

//- (NSDictionary *)getPoints {
//    NSLog(@"Calling the wrong method");
//    return @{@"matchBonus": [NSNumber numberWithInt:0], @"mismatchPenalty": [NSNumber numberWithInt:0], @"costToChoose": [NSNumber numberWithInt:0]};
//}

@end
