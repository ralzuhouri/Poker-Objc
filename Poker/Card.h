//
//  Card.h
//  Poker
//
//  Created by Ramy Al Zuhouri on 8/24/12.
//  Copyright (c) 2012 Ramy Al Zuhouri. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    Spades, Clubs, Diamonds, Hearts
}Seed;

@interface Card : NSObject
{
@private
    NSImage* image;
    Seed seed;
    unsigned int value;
    BOOL keep;
}

@property (readonly) Seed seed;
@property (readonly) unsigned int value;
@property (readwrite) BOOL keep;

- (id) initWithInt: (int) value ofSeed: (Seed) seed;
- (NSImage*) image;
- (int) compare: (Card*) card;
- (BOOL) sameSeed: (Card*) card;
- (BOOL) sameValue: (Card*) card;

@end
