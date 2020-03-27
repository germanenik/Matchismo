//
//  SetCard.h
//  Matchismo
//
//  Created by German Enik on 3/24/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

#pragma mark - properties
@property (strong, nonatomic) NSString *symbol;
@property (nonatomic) NSUInteger count;
@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *shade;

#pragma mark - instance methods
- (NSDictionary *)contentsOfSetCard;

#pragma mark - static mmethods
+ (NSArray *)validSymbols;
+ (NSUInteger)maxCount;
+ (NSArray *)validColors;
+ (NSArray *)validShades;

@end

