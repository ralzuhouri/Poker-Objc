//
//  Preferences.h
//  Poker
//
//  Created by Ramy Al Zuhouri on 8/25/12.
//  Copyright (c) 2012 Ramy Al Zuhouri. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define bgColorKey @"bgColorKey"

@interface Preferences : NSWindowController

@property (weak) IBOutlet NSColorWell *colorWell;

+ (void) initialize;
+ (NSColor*) bgColor;
+ (void) setBgColor: (NSColor*) color;
- (id) init;
- (IBAction) changeBgColor:(id)sender;

@end
