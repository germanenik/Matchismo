//
//  SetGame.h
//  Matchismo
//
//  Created by German Enik on 3/25/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "CardMatchingGame.h"

NS_ASSUME_NONNULL_BEGIN

@interface SetGame : CardMatchingGame
//due to more complex text formatting, store cost and currCards
@property (nonatomic) NSString *costPhrase;
@property (strong, nonatomic) NSArray *currentCards; //of cards
@end

NS_ASSUME_NONNULL_END
