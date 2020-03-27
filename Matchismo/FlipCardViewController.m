//
//  FlipCardViewController.m
//  Matchismo
//
//  Created by German Enik on 3/24/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "FlipCardViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCardMatchingGame.h"

@interface FlipCardViewController ()

@end

@implementation FlipCardViewController

@synthesize game = _game;

- (CardMatchingGame *)game {
    if (!_game) _game = [[PlayingCardMatchingGame alloc] initWithCardCount:[self.cardButtons count]  usingDeck:[self createDeck]];
    return _game;
}

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (void) updateUI {
    for (UIButton *button in self.cardButtons){
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:button];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self backgroundImageForCard: card] forState:UIControlStateNormal];
        [button setEnabled:!card.isMatched];
        [button setAlpha: card.isMatched ? 0.5 : 1.0];
        [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %ld", self.game.score]];
        [self.actionLabel setText:self.game.lastAction];
    }
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed: card.isChosen ? @"cardfront" : @"cardback" ];
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
