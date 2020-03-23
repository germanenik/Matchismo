//
//  Card.m
//  Matchismo
//
//  Created by German Enik on 3/19/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int) match:(NSArray *)otherCards{
    //instantiate the array
    int score = 0;
    
    for(Card *card in otherCards){
        if([card.contents isEqualToString:self.contents]){
            score = 1;
            break;
        }
    }
    return score;
}

@end
