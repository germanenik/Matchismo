//
//  PlayingCard.m
//  Matchismo
//
//  Created by German Enik on 3/19/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards {
    int score = 0;
    if([otherCards count] == 1) { //single for now
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        } else if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        }
    }
    return score;
}

-(NSString*)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+(NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",
             @"9",@"10",@"J",@"Q",@"K"];
}

@synthesize suit = _suit;

//suit setter
-(void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}
//suit getter
-(NSString *)suit{
    return _suit ? _suit : @"?";
}

@synthesize rank = _rank;

//rank setter
-(void)setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        //what about 0??
        _rank = rank;
    }
}

//rank getter
-(NSUInteger)rank{
    return _rank ? _rank : 0;
}

//helper funcs for setters and getters
+(NSArray *)validSuits{
    return @[@"♥️",@"♦️",@"♣️",@"♠️"];
}

+(NSUInteger)maxRank{
    return 13;
}

@end
