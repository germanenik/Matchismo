//
//  PlayingCardMatchingGame.m
//  Matchismo
//
//  Created by German Enik on 3/25/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "PlayingCardMatchingGame.h"

@implementation PlayingCardMatchingGame

static const int MISMATCHPENALTY = 2;
static const int MATCHBONUS = 4;
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

//- (NSDictionary *)getPoints {
////    NSLog(@"Calling right method");
//    return @{@"matchBonus": [NSNumber numberWithInt:4], @"mismatchPenalty": [NSNumber numberWithInt:2], @"costToChoose": [NSNumber numberWithInt:1]};
//}

@end
