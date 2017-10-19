//
//  NSMutableArray+Swap.m
//  Poker
//
//  Created by Ramy Al Zuhouri on 8/24/12.
//  Copyright (c) 2012 Ramy Al Zuhouri. All rights reserved.
//

#import "NSMutableArray+Swap.h"

@implementation NSMutableArray (Swap)

- (void) swapObjectAtIndex: (int) index withIndex: (int) other
{
    id obj1, obj2;
    obj1= [self objectAtIndex: index];
    obj2= [self objectAtIndex: other];
    [self replaceObjectAtIndex: index withObject: obj2];
    [self replaceObjectAtIndex: other withObject: obj1];
}

@end
