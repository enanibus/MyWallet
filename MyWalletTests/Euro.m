//
//  Euro.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 18/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import "Euro.h"
#import "Money-Private.h"

@implementation Euro

-(Euro*)times: (NSInteger) multiplier{
    
    Euro *newEuro = [[Euro alloc]
                     initWithAmount:[self.amount integerValue] * multiplier];
    return newEuro;
}


#pragma mark - Overwritten


@end
