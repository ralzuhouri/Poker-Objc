//
//  Desk.m
//  Poker
//
//  Created by Ramy Al Zuhouri on 8/24/12.
//  Copyright (c) 2012 Ramy Al Zuhouri. All rights reserved.
//

#import "Deck.h"

@implementation Deck

@synthesize cards;

- (id) init
{
    self= [super init];
    if(self)
    {
        srandom((unsigned int)time(NULL));
        cards=[[NSMutableArray alloc]init];
        for(int i=0; i<13; i++)
        {
            for(int j=0; j<4; j++)
            {
                Card* card= [[Card alloc]initWithInt: i ofSeed: j];
                [cards addObject: card];
            }
        }
    }
    return self;
}

- (void) mix
{
    for(int i=0; i<N; i++)
    {
        int i1= random()%52, i2= random()%52;
        [cards swapObjectAtIndex: i1 withIndex: i2];
    }
}

- (void) discard
{
    int next= 5;
    for(int i=0; i<5; i++)
    {
        Card* c= [cards objectAtIndex: i];
        if(![c keep])
        {
            [cards swapObjectAtIndex: i withIndex: next];
            [c setKeep: YES];
            next++;
        }
    }
}

- (void) sort
{
    for(int i=0; i<4; i++)
    {
        for(int j=0; j<4-i; j++)
        {
            Card* c1=[cards objectAtIndex: j];
            Card* c2=[cards objectAtIndex: j+1];
            if([c1 compare: c2] > 0)
                [cards swapObjectAtIndex: j withIndex: j+1];
        }
    }
}

- (int) checkPoints
{
    BOOL color=YES;
    BOOL ladder= YES;
    BOOL couple= NO;
    BOOL tris= NO;
    BOOL poker= NO;
    BOOL max;
    BOOL one;
    BOOL figure;
    int couples=0;
    int ntris=0;
    for(int i=0; i<4; i++)
    {
        Card* c1= [cards objectAtIndex: i];
        Card* c2= [cards objectAtIndex: i+1];
        one= [c1 value]==0 || [c2 value]== 0;
        figure= [c1 value] >= 10 || [c2 value] >= 10;
        color= color && [c1 sameSeed: c2];
        ladder= (ladder && [c1 value] == [c2 value]-1) || (ladder && i==3 && [c1 value]==4 && [c2 value]==0) ||
        (ladder && i==3 && [c1 value]==12 && [c2 value]==0);
        if(i==3)
        {
            max= [c1 value]==13 && [c1 seed]== Hearts;
        }
        if(tris && !poker)
        {
            poker=[c1 value] == [c2 value];
        }
        tris= couple && [c1 value] == [c2 value];
        couple= [c1 value] == [c2 value];
        if(tris)
        {
            ntris++;
            couples--;
        }
        else if(couple)
        {
            couples++;
        }
    }
    if(ntris==1)
    {
        if(couples==1)
            return 50;
        return 20;
    }
    if(poker)
        return 70;
    if(couples==2)
        return 12;
    if(couples==1)
        return 7;
    if(ladder)
    {
        if(color)
        {
            if(max)
                return 90;
            return 100;
        }
        else
            return 30;
    }
    if(color)
        return 40;
    if(one)
        return 2;
    if(figure)
        return 2;
    return 0;
}

+ (NSString*) handName : (int) points
{
    switch(points)
    {
        case 2:
            return @"High card";
        case 7:
            return @"One pair";
        case 12:
            return @"Two pair";
        case 20:
            return @"Tris";
        case 30:
            return @"Straight";
        case 40:
            return @"Flush";
        case 50:
            return @"Full house";
        case 70:
            return @"Poker";
        case 90:
            return @"Straight flush";
        case 100:
            return @"Perfect straight flush";
        default:
            return @"Nothing";
    }
}


@end


















