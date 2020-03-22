//
//  ViewController.m
//  Matchismo
//
//  Created by German Enik on 3/19/20.
//  Copyright © 2020 German's Dope Apps. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) PlayingCardDeck *deck;
@end

@implementation ViewController

-(PlayingCardDeck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}
-(PlayingCardDeck *)deck{
    if(!_deck) _deck = [self createDeck];
    return _deck;
}

-(void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"Flips did change w count: %d", self.flipCount);
}

-(IBAction)touchCardButton:(UIButton *)sender {
    
    if ([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        Card *card = [self.deck drawRandomCard];
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        [sender setTitle:card.contents forState:UIControlStateNormal];
    }
    self.flipCount++;
    

}



@end
