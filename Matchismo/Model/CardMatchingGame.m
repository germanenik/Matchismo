//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by German Enik on 3/22/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //ofCards
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
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return index < [self.cards count] ? self.cards[index] : nil;
}

static const int MISMATCHPENALTY = 2;
static const int MATCHBONUS = 4;
static const int COSTTOCHOOSE = 1;


- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            //match against other chosen cards
            for (Card *otherCard in self.cards) {
                if (!otherCard.isMatched && otherCard.isChosen) {
                    int matchScore = [card match:@[otherCard]];
                    
                    if (matchScore) {
                        self.score += matchScore * MATCHBONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= MISMATCHPENALTY;
                        otherCard.chosen = NO; //unchoose
                    }
                    break; //bc only choose 2 cards for now
                }
                
            }
            self.score -= COSTTOCHOOSE;
            card.chosen = YES;
        }
        
    }
}

@end
