//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by German Enik on 3/20/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(instancetype)init{
    self = [super init];
    
    if(self){
        for(NSString *suit in [PlayingCard validSuits]){
            for(NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++){
                PlayingCard *card = [[PlayingCard alloc] init];
                [card setRank:rank];
                [card setSuit:suit];
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
