//
//  AppDelegate.h
//  Poker
//
//  Created by Ramy Al Zuhouri on 8/24/12.
//  Copyright (c) 2012 Ramy Al Zuhouri. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Deck.h"
#import "Card.h"
#import "Preferences.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSWindowDelegate>
{
@private
    Deck* deck;
    int points;
    Preferences* preferences;
}


@property (weak) IBOutlet NSMatrix *boxes;
@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSMatrix *cells;
@property (weak) IBOutlet NSTextField *pointsTextField;


- (id) init;
- (void) loadImages;
- (IBAction)clickCard:(id)sender;
- (IBAction)discard:(id)sender;
- (IBAction) showPreferences :(id)sender;
- (IBAction) colorDidChange :(id)sender;


@end
