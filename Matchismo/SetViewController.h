//
//  SetViewController.h
//  Matchismo
//
//  Created by German Enik on 3/24/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "ViewController.h"
#import "SetGame.h"

NS_ASSUME_NONNULL_BEGIN

@interface SetViewController : ViewController
@property (strong, nonatomic) SetGame *game;
//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
//@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
//@property (weak, nonatomic) IBOutlet UILabel *actionLabel;
@end

NS_ASSUME_NONNULL_END
