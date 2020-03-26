//
//  FlipCardViewController.h
//  Matchismo
//
//  Created by German Enik on 3/24/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardMatchingGame.h"
NS_ASSUME_NONNULL_BEGIN

@interface FlipCardViewController : ViewController
@property (strong, nonatomic) PlayingCardMatchingGame *game;
//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
//@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
//@property (weak, nonatomic) IBOutlet UILabel *actionLabel;
@end

NS_ASSUME_NONNULL_END
