//
//  SetDeck.m
//  Matchismo
//
//  Created by German Enik on 3/24/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "SetDeck.h"
#import "SetCard.h"

@implementation SetDeck

-(instancetype)init {
    self = [super init];
    
    if (self) {
        for (NSString *symbol in [SetCard validSymbols]) {
            for (NSUInteger i = 1; i <= [SetCard maxCount]; i++) {
                for (NSString *color in [SetCard validColors]) {
                    for (NSString *shade in [SetCard validShades]) {
                        SetCard *card = [[SetCard alloc] init];
                        
                        //set card deets
                        card.symbol = symbol;
                        card.count = i;
                        card.color = color;
                        card.shade = shade;
                        
                        [self addCard:card];
                    }
                }
            }
        }
    }
    
    return self;
}

@end
