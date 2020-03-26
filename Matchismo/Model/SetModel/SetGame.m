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
  
    self.lastAction = [NSString stringWithFormat:@"You chose %@\nfor %d point penalty.", card.contents, COSTTOCHOOSE];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
            self.lastAction = [NSString stringWithFormat:@"You unchose %@.", card.contents];
        } else {
            //match against other chosen cards
            NSMutableArray *otherCards = [[NSMutableArray alloc] init];

            for (Card *otherCard in self.cards) {
                if (!otherCard.isMatched && otherCard.isChosen) {
                    [otherCards addObject:otherCard];
                    
                    if ([otherCards count] == 2){
                        int matchScore = [card match:otherCards];
                        if (matchScore) {
                            int toAdd = matchScore * MATCHBONUS;
                            self.score += toAdd;
                            //choose the three cards
                            card.matched = YES;
                            for (Card *card in otherCards) [card setChosen:YES];
                            self.lastAction = [NSString stringWithFormat:@"You matched %@ and %@\nand gained %d points!\nRockin it.", card.contents, otherCard.contents, toAdd];
                        } else {
                            self.score -= MISMATCHPENALTY;
                            //unchoose all
                            card.chosen = NO;
                            for (Card *card in otherCards) [card setChosen:NO];
                            
                            self.lastAction = [NSString stringWithFormat:@"You mismatched %@ and %@\nfor %d penalty.\nSad face.", card.contents, otherCard.contents, MISMATCHPENALTY];
                        }
                        break;
                    }
                }
            }
            
            self.score -= COSTTOCHOOSE;
            card.chosen = YES;
        }
    }
}

@end
