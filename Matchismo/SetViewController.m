//
//  SetViewController.m
//  Matchismo
//
//  Created by German Enik on 3/24/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "SetViewController.h"
#import "SetDeck.h"
#import "SetGame.h"


@interface SetViewController ()

@end

@implementation SetViewController

@synthesize game = _game;

- (CardMatchingGame *)game {
//    if (!_game) _game = [[SetGame alloc] initWithCardCount:[self.cardButtons count]  usingDeck:[self createDeck]];
//
//    return _game;
    return nil;
}

- (Deck *)createDeck {
    return [[SetDeck alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
