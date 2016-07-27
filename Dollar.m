//
//  Dollar.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 25/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import "Dollar.h"
#import "Money-Private.h"

@implementation Dollar

-(Dollar*)times: (NSInteger) multiplier{
    
    Dollar *newDollar = [[Dollar alloc]
                     initWithAmount:[self.amount integerValue] * multiplier];

    return newDollar;
}


#pragma mark - Overwritten

@end
