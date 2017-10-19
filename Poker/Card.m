//
//  Card.m
//  Poker
//
//  Created by Ramy Al Zuhouri on 8/24/12.
//  Copyright (c) 2012 Ramy Al Zuhouri. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize seed;
@synthesize value;
@synthesize keep;

- (id) initWithInt: (int) theValue ofSeed: (Seed) theSeed
{
    self= [super init];
    if(self)
    {
        keep= YES;
        value= theValue;
        seed = theSeed;
    }
    return self;
}

- (NSImage*) image
{
    if(!image)
    {
        NSString* name= [[NSString alloc]initWithFormat: @"%d-%d", seed+1, value+1];
        NSString* bundlePath= [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent: @"Contents/Resources/cards.bundle"];
        NSBundle* bundle= [NSBundle bundleWithPath: bundlePath];
        NSString* path=[bundle pathForImageResource: name];
        image=[[NSImage alloc]initWithContentsOfFile: path];
    }
    return image;
}

- (int) compare: (Card*) card
{
    int _value=[card value], _seed=[card seed];
    int __value=value;
    if(_value==0)
        _value=14;
    if(__value==0)
        __value=14;
    return 14*(__value-_value) - (seed - _seed);
}

- (BOOL) sameSeed: (Card*) card
{
    return seed == [card seed];
}


- (BOOL) sameValue: (Card*) card
{
    return value == [card value];
}


@end
















