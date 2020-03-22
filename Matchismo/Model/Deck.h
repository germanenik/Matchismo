//
//  Deck.h
//  Matchismo
//
//  Created by German Enik on 3/20/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card;
-(void)addCard:(Card *)card atTop:(BOOL)atTop;

-(Card *)drawRandomCard;
@end

