//
//  Desk.h
//  Poker
//
//  Created by Ramy Al Zuhouri on 8/24/12.
//  Copyright (c) 2012 Ramy Al Zuhouri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "NSMutableArray+Swap.h"

#define N 250

@interface Deck : NSObject
{
@private
    NSMutableArray* cards;
}

@property (readonly) NSMutableArray* cards;

- (id) init;
- (void) mix;
- (void) discard;
- (void) sort;
- (int) checkPoints;
+ (NSString*) handName : (int) points;


@end
