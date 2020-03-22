//
//  Deck.m
//  Matchismo
//
//  Created by German Enik on 3/20/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation Deck

-(NSMutableArray *)cards{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void)addCard:(Card *)card{
    [self.cards addObject:card];
}
-(void)addCard:(Card *)card atTop:(BOOL)atTop{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self addCard:card];
    }
}

-(Card *)drawRandomCard{
    Card *randomCard = nil;
    NSUInteger cnt = [self.cards count];
    if(cnt){
        unsigned index = arc4random() % cnt;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end
