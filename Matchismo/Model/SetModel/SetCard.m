//
//  SetCard.m
//  Matchismo
//
//  Created by German Enik on 3/24/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

@synthesize contents = _contents;

- (NSString *)contents {
    return [self description];
}

- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    if ([otherCards count] == 2) {
        for (NSString *feature in [self contentsOfSetCard]) {
            NSString *value = [self contentsOfSetCard][feature];
            NSString *value1 = [[otherCards firstObject] contentsOfSetCard][feature];
            NSString *value2 = [[otherCards lastObject] contentsOfSetCard][feature];
            
            BOOL bool1 = [value isEqualToString:value1];
            BOOL bool2 = [value1 isEqualToString:value2];
            BOOL bool3 = [value isEqualToString:value2];
            
            if (bool1 == bool2 && bool2 == bool3 && bool1 == bool3) {
                score = 1;
            } else {
                score = 0;
                break;
            }
        }
    }
    return score;
}


//potential bugs
- (NSDictionary *)contentsOfSetCard {
    return @{@"symbol": self.symbol, @"color": self.color, @"count": [NSString stringWithFormat:@"%lu", self.count], @"shade": self.shade};
}

+ (NSArray *)validSymbols {
    return @[@"▲", @"●", @"■"];
}
+ (NSUInteger)maxCount {
    return 3;
}
+ (NSArray *)validColors {
    return @[@"green", @"red", @"blue"];
}
+ (NSArray *)validShades {
    return @[@"0.1", @"0.5", @"1.0"];
}

@end
