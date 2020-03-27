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
#import "SetCard.h"


@interface SetViewController ()
@end

@implementation SetViewController

@synthesize game = _game;

- (CardMatchingGame *)game {
    if (!_game) _game = [[SetGame alloc] initWithCardCount:[self.cardButtons count]  usingDeck:[self createDeck]];
    return _game;
    //return nil;
}

- (Deck *)createDeck {
    return [[SetDeck alloc] init];
}

- (void) updateUI {
    for (UIButton *button in self.cardButtons){
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:button];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [button setAttributedTitle:[self attrTitleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundColor:[self backgroundForCard:card]];
        [button setEnabled:!card.isMatched];
        [button setAlpha: card.isMatched ? 0 : 1.0];
    }
    [self.scoreLabel setAttributedText:[self formatTextForString:[NSString stringWithFormat:@"Score: %ld", self.game.score]]];
    [self.actionLabel setAttributedText:[self getActionLabelText]];
}

- (NSAttributedString *) attrTitleForCard:(Card *)card {
    //NSMutableAttributedString *str = [[NSMutableAttributedString alloc] init];
    NSAttributedString *title = [[NSAttributedString alloc] init];
    
    if ([card isMemberOfClass:[SetCard class]]){
        SetCard *setCard = (SetCard *)card;
        UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
        UIColor *frameColor = [self getColorFromString:setCard.color];
        UIColor *fillColor = [frameColor colorWithAlphaComponent:[setCard.shade floatValue]];
        //NSLog(@"%@", titleColor);
        NSDictionary *attributes = @{NSFontAttributeName: font, NSForegroundColorAttributeName: fillColor, NSStrokeColorAttributeName: frameColor, NSStrokeWidthAttributeName : [NSNumber numberWithFloat:-10.0]};
        
        //build the base string
        NSString *baseString = @"";
        for (int i = 0; i < setCard.count; i++) baseString = [baseString stringByAppendingString:setCard.symbol];
        title = [title initWithString:baseString ?: @"" attributes: attributes];
    }
    
    return title;
}
-(UIColor *)getColorFromString:(NSString *)colorName {
    if ([colorName isEqualToString:@"green"]) {
        return [UIColor greenColor];
    } else if ([colorName isEqualToString:@"red"]) {
        return [UIColor redColor];
    } else if ([colorName isEqualToString:@"blue"]) {
        return [UIColor blueColor];
    } else {
        return [UIColor blackColor];
    }
}
- (NSAttributedString *) getActionLabelText {
    NSMutableAttributedString *action = [[NSMutableAttributedString alloc] init];
    [action appendAttributedString:[self formatTextForString:self.game.lastAction]];
    
    for (int i = 0; i < [self.game.currentCards count]; i++){
        Card *card = self.game.currentCards[i];
        [action appendAttributedString:[self attrTitleForCard:card]];
        if (i < [self.game.currentCards count] - 1) [action appendAttributedString:[self formatTextForString:@"&"]];
    }
    
    [action appendAttributedString:[self formatTextForString:self.game.costPhrase]];
    return action;
}

- (NSAttributedString *) formatTextForString:(NSString*) label {
    //NSString *baseScore = [NSString stringWithFormat:@"Score: %ld", self.game.score];
    NSAttributedString *formattedScore = [[NSAttributedString alloc] init];
    formattedScore = [formattedScore initWithString:label ?: @"" attributes:@{NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote]}];
    
    return formattedScore;
}


//+ (NSDictionary *)getSymbols {
//}

- (UIColor *)backgroundForCard:(Card *)card {
    return card.isChosen ? [UIColor yellowColor] : [UIColor whiteColor];
}

#pragma mark - system methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self updateUI];
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
