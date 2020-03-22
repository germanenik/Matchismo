//
//  Card.h
//  Matchismo
//
//  Created by German Enik on 3/19/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

-(int)match:(NSArray *)otherCards;

@end

