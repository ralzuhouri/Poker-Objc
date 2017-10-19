//
//  Preferences.m
//  Poker
//
//  Created by Ramy Al Zuhouri on 8/25/12.
//  Copyright (c) 2012 Ramy Al Zuhouri. All rights reserved.
//

#import "Preferences.h"


@implementation Preferences
@synthesize colorWell;

+ (void) initialize
{
    NSUserDefaults* defaults=[NSUserDefaults standardUserDefaults];
    NSData* data=[NSKeyedArchiver archivedDataWithRootObject: [NSColor greenColor]];
    NSDictionary* dictionary=[NSDictionary dictionaryWithObject: data forKey: bgColorKey];
    [defaults registerDefaults: dictionary];
}

+ (NSColor*) bgColor
{
    NSUserDefaults* defaults=[NSUserDefaults standardUserDefaults];
    NSData* data=[defaults objectForKey: bgColorKey];
    return [NSKeyedUnarchiver unarchiveObjectWithData: data];
}

+ (void) setBgColor: (NSColor*) color
{
    NSUserDefaults* defaults=[NSUserDefaults standardUserDefaults];
    NSData* data=[NSKeyedArchiver archivedDataWithRootObject: color];
    [defaults setObject: data forKey: bgColorKey];
}

- (id) init
{
    self=[super initWithWindowNibName: @"Preferences"];
    return self;
}

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow: window];
    if (self)
    {
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    [colorWell setColor: [Preferences bgColor]];
}


#pragma mark Actions

- (IBAction) changeBgColor:(id)sender
{
    NSNotificationCenter* center=[NSNotificationCenter defaultCenter];
    [Preferences setBgColor: [sender color]];
    [center postNotificationName: @"colorDidChange" object: self];
}

@end















