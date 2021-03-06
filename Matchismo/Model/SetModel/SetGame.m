//
//  SetGame.m
//  Matchismo
//
//  Created by German Enik on 3/25/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "SetGame.h"

@interface SetGame()
//@property (strong, nonatomic) NSMutableArray *currentCards; //of Cards
@end

@implementation SetGame

static const int MISMATCHPENALTY = 2;
static const int MATCHBONUS = 8;
static const int COSTTOCHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
  
    self.lastAction = @"You chose ";
    self.costPhrase = [NSString stringWithFormat:@"\nfor %d point penalty", COSTTOCHOOSE];
    
    if (!card.isMatched) {
        self.currentCards = @[card];
        
        if (card.isChosen) {
            card.chosen = NO;
            //formatting
            self.lastAction = @"You unchose ";
            self.costPhrase = @"";
        } else {
            //match against other chosen cards
            card.chosen = YES;
            NSMutableArray *otherCards = [[NSMutableArray alloc] init];

            for (Card *otherCard in self.cards) {
                if (!otherCard.isMatched && otherCard.isChosen && ![otherCard isEqual:card]) {
                    [otherCards addObject:otherCard];
                    
                    if ([otherCards count] == 2){
                        int matchScore = [card match:otherCards];
                        if (matchScore) {
                            int toAdd = matchScore * MATCHBONUS;
                            self.score += toAdd;
                            //choose the three cards
                            card.matched = YES;
                            for (Card *card in otherCards) [card setMatched:YES];
                            
                            //formatting
                            self.lastAction = @"You matched ";
                            self.costPhrase = [NSString stringWithFormat:@" and gained %d points!\nRockin it.", toAdd];
                        } else {
                            self.score -= MISMATCHPENALTY;
                            //unchoose all
                            card.chosen = NO;
                            for (Card *card in otherCards) [card setChosen:NO];
                            
                            self.lastAction = @"You mismatched ";
                            self.costPhrase = [NSString stringWithFormat: @"\nfor %d penalty.\nSad face.", MISMATCHPENALTY];
                        }
                        self.currentCards = @[card, otherCards.firstObject, otherCards.lastObject];
                        break;
                    }
                }
            }
            self.score -= COSTTOCHOOSE;
        }
    }
}

@end
