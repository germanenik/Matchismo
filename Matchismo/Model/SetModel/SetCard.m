//
//  SetCard.m
//  Matchismo
//
//  Created by German Enik on 3/24/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard



- (NSDictionary *)contents {
    return @{@"symbol": self.symbol, @"color": self.color, @"count": [NSNumber numberWithUnsignedLong:self.count], @"shade": self.shade};
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
    return @[(NSNumber *)@"0.1", (NSNumber *)@"0.6", (NSNumber *)@"1.0"];
}

@end
