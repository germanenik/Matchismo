//
//  FlipCardViewController.m
//  Matchismo
//
//  Created by German Enik on 3/24/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "FlipCardViewController.h"
#import "PlayingCardDeck.h"
@interface FlipCardViewController ()

@end

@implementation FlipCardViewController

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
