//
//  Dollar.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 25/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import "Dollar.h"

@interface Dollar()

@property(readonly) NSInteger amount;

@end

@implementation Dollar

-(instancetype) initWithAmount:(NSInteger) amount{
    
    if (self = [super init]){
        _amount = amount;
    }
    return self;
}

-(Dollar*)times: (NSInteger) multiplier{
    
    Dollar *newDollar = [[Dollar alloc]
                     initWithAmount:self.amount *multiplier];
    return newDollar;
}


#pragma mark - Overwritten
-(BOOL)isEqual:(id)object{
    
    return [self amount] == [object amount];
}

-(NSUInteger) hash{
    
    return (NSUInteger) self.amount;
}

@end
