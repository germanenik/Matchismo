//
//  ViewController.h
//  Matchismo
//
//  Created by German Enik on 3/19/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//
//absract class - must implement methods as below

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"


@interface ViewController : UIViewController

@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *actionLabel;

- (void)updateUI;
- (Deck *)createDeck; //abstract
//- (NSString *)titleForCard:(Card *)card; //abstract
//- (UIImage *)backgroundImageForCard:(Card *)card; //abstract
@end

