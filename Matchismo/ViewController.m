//
//  ViewController.m
//  Matchismo
//
//  Created by German Enik on 3/19/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "ViewController.h"
//#import "PlayingCardDeck.h"
//#import "CardMatchingGame.h"

@interface ViewController ()
//@property (strong, nonatomic) CardMatchingGame *game;
//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
//@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
//@property (weak, nonatomic) IBOutlet UILabel *actionLabel;
@end

@implementation ViewController

- (CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]  usingDeck:[self createDeck]];
    return _game;
}

- (Deck *)createDeck { //abstract
    //return [[PlayingCardDeck alloc] init];
    return nil;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger index = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:index];
    [self updateUI];
}

//reset the whole thing
- (IBAction)touchDealButton {
    self.game = [_game restartWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    [self updateUI];
}

- (void)updateUI {
    //do something
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
//    self.game = [_game restartWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
//    [self updateUI];
}

@end
