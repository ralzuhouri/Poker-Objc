//
//  AppDelegate.m
//  Poker
//
//  Created by Ramy Al Zuhouri on 8/24/12.
//  Copyright (c) 2012 Ramy Al Zuhouri. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize boxes;
@synthesize cells;
@synthesize pointsTextField;
@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [pointsTextField setStringValue: @"100"];
    [window setBackgroundColor: [Preferences bgColor]];
    [deck sort];
    [self loadImages];
}

- (NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize
{
    return [sender frame].size;
}

- (id) init
{
    self=[super init];
    if(self)
    {
        NSNotificationCenter* center=[NSNotificationCenter defaultCenter];
        [center addObserver: self selector: @selector(colorDidChange:) name: @"colorDidChange" object: nil];
        deck=[[Deck alloc]init];
        [deck mix];
        points=100;
    }
    return self;
}

- (void) loadImages
{
    NSMutableArray* cards=[deck cards];
    for(int i=0; i<5; i++)
    {
        NSCell* cell= [cells cellAtRow: 0 column: i];
        Card* card= [cards objectAtIndex: i];
        [cell setImage: [card image]];
    }
}

#pragma mark Actions

- (IBAction)clickCard:(id)sender
{
    NSMutableArray* cards=[deck cards];
    id cell=[sender selectedCell];
    Card* card;
    NSUInteger state= [cell state];
    long index= [cell tag]-1;
    card= [cards objectAtIndex: index];
    [card setKeep: state ];
}



- (IBAction)discard:(id)sender
{
    NSMutableArray* cards=[deck cards];
    int gain;
    int count=0;
    for(int i=0; i<5; i++)
    {
        NSCell* cell=[boxes cellAtRow: 0 column: i];
        if (![cell state])
            count++;
    }
    if(count==5)
    {
        NSBeep();
        NSRunAlertPanel(@"Cannot discard", @"You cannot discard more than 4 cards", @"Ok", nil, nil);
    }
    else
    {
        [deck discard];
        [deck sort];
        [self loadImages];
        for(int i=0; i<5; i++)
        {
            NSCell* cell= [boxes cellAtRow: 0 column: i];
            Card* card=[cards objectAtIndex: i];
            [cell setState: 1];
            [card setKeep: YES];
        }
        gain= [deck checkPoints];
        points= points-10 +gain;
        NSRunAlertPanel([Deck handName: gain], @"You gain %d points", @"Continue", nil, nil, gain);
        [pointsTextField setStringValue: [NSString stringWithFormat: @"%d", points]];
        [deck mix];
        [deck sort];
        [self loadImages];
    }
}


- (IBAction) showPreferences :(id)sender
{
    if(!preferences)
    {
        preferences=[[Preferences alloc]init];
    }
    [preferences showWindow: self];
}

- (IBAction) colorDidChange :(id)sender
{
    [window setBackgroundColor: [Preferences bgColor]];
}


@end















