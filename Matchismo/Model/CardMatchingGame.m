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
@property (nonatomic, readwrite) NSString *lastAction;
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

static const int MISMATCHPENALTY = 2;
static const int MATCHBONUS = 4;
static const int COSTTOCHOOSE = 1;


- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    self.lastAction = [NSString stringWithFormat:@"You chose %@\nfor %d point penalty.", card.contents, COSTTOCHOOSE];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
            self.lastAction = [NSString stringWithFormat:@"You unchose %@\nfor %d point penalty.", card.contents, COSTTOCHOOSE];
        } else {
            //match against other chosen cards
            for (Card *otherCard in self.cards) {
                if (!otherCard.isMatched && otherCard.isChosen) {
                    int matchScore = [card match:@[otherCard]];
                    
                    if (matchScore) {
                        int toAdd = matchScore * MATCHBONUS;
                        self.score += toAdd;
                        card.matched = YES;
                        otherCard.matched = YES;
                        self.lastAction = [NSString stringWithFormat:@"You matched %@ and %@\nand gained %d points!\nRockin it.", card.contents, otherCard.contents, toAdd];
                    } else {
                        self.score -= MISMATCHPENALTY;
                        otherCard.chosen = NO; //unchoose
                        self.lastAction = [NSString stringWithFormat:@"You mismatched %@ and %@\nfor %d penalty.\nSad face.", card.contents, otherCard.contents, MISMATCHPENALTY];
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
